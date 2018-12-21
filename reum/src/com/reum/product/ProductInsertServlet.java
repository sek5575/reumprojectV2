package com.reum.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;
import com.reum.common.MyBatisFactory;
import com.reum.common.MyFileRenamePolicy;
import com.reum.users.UsersDAO;
import com.reum.users.UsersVO;


@WebServlet("/productInsertServlet")
public class ProductInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String saveDirectory = "c://uploads/product";

		HttpSession session = request.getSession();
		String sess_id = session.getAttribute("SESS_ID").toString();  //sessionid가 없는 유저는 등록을 못하도록 막도록 코딩

		if(sess_id.equals("") || sess_id == null) {
			response.sendRedirect("404.jsp");
		} else {


			/* ---------------------------------------------------------------
			 * shop_pic : cos.jar MultipartParser를 이용한  멀티 파일업로드 드래그 처리
			 * <input type="file" name="files[]" multiple>  name 1개로 여러 파일 올릴 경우
			 * ---------------------------------------------------------------
			 */
			MyFileRenamePolicy pol = new MyFileRenamePolicy();
			MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 10, false, false, "UTF-8"); 
			Part part=null;
			HashMap<String, Object> smap = new HashMap<String, Object>();
			ArrayList<ProductPicVO> pvolist  = new ArrayList<ProductPicVO>();
			while ((part = parser.readNextPart()) != null) {
				String inputName = part.getName();
				if (part.isParam()) {
					ParamPart paramPart = (ParamPart)part;
					String value = paramPart.getStringValue();
					smap.put(inputName, value);
				} else if (part.isFile()) {
					ProductPicVO pvo = new ProductPicVO();

					FilePart filePart = (FilePart)part;
					//내가 정의한 파일 리네임 폴리시 사용....셋팅
					filePart.setRenamePolicy(pol);

					String fileName = filePart.getFileName();

					//파일업로드
					if (fileName != null) {
						long fileSize = filePart.writeTo(new File(saveDirectory));   //writeTo 하는 동시에 여기서 업로드. 리네임도 같이 진행된다.
						//					filePart.getFileName();  	//리네임
						//					filePart.getFilePath();		//원본명

						//원본파일명
						//pvo.setPname(filePart.getFilePath());
						pvo.setProductAttachPname(fileName);
						//파일 리네임명
						pvo.setProductAttachSysname(filePart.getFileName());

						System.out.println(filePart.getFileName());
						//파일경로	
						pvo.setProductAttachPpath(saveDirectory);
						if(pvolist.size() == 0) {
							pvo.setProductAttachMain("y");
						} else {
							pvo.setProductAttachMain("n");
						}

						//파일크기
						//pvo.setFileSize(fileSize);

						pvolist.add(pvo);

					} else {
						System.out.println("error");
					}
				}
			} 

			//		(product_seq, product_name, product_regdate, product_description,
			//				product_price, product_status, product_del, loc_seq, cate_seq)


			//--------------------------------------------
			// * DB Connection 
			//   트랙잭션 관리 : conn.setAutoCommit(false)
			//--------------------------------------------
			SqlSession conn = MyBatisFactory.getFactory().openSession();


			//--------------------------------------------
			// 1. CURRVAL+1 SSEQ 가져오기
			//--------------------------------------------
			ProductDAO dao = new ProductDAO();
			int next_sseq = dao.selectNextSseq(conn); //첨부파일 최대seq

			if(next_sseq > 0) {
				try {
					//--------------------------------------------
					// 2. DB저장작업
					//    SHOP_INFO 테이블 정보 입력 : 1번 입력
					//--------------------------------------------



					Gson gson = new Gson();
					JsonElement jsonElement = gson.toJsonTree(smap);      //smap의 이름과 product_register의 name값이 일치해야 VO도 일치하기 때문에 값이 들어온다.
					ProductVO svo = gson.fromJson(jsonElement, ProductVO.class);
					//svo.setProductSeq(productSeq);
					//				svo.setRegid(sess_id);
					int infoInsertRes = dao.insertProductInfo(svo, conn); //여기서 productSeq가 만들어진다.
					int maxSeq = dao.selectMaxSeq(conn);

					//--------------------------------------------
					// 3. DB저장작업
					//    SHOP_PIC 테이블 정보 입력 : pvolist.size()번 입력
					//--------------------------------------------
					if(infoInsertRes > 0) {
						int shopPicInsertRes = 0;
						for(int i=0; i<pvolist.size(); i++) {
							//pvolist.get(i).setProductAttachSeq(next_sseq); 
							pvolist.get(i).setProductSeq(maxSeq);
							shopPicInsertRes = dao.insertProductPic(pvolist.get(i), conn);
						}
					} 
					UsersDAO uao = new UsersDAO();
					UsersVO uvo = uao.selectUserSeq(sess_id, conn);
					
					SellerVO selvo = new SellerVO();
					selvo.setSellerSeq(uvo.getUserSeq());
					selvo.setProductSeq(maxSeq);
					
					int selres = dao.insertSeller(selvo, conn);
					System.out.println(selres + "건 seller테이블에 추가");
					
					
					//conn에 의한 모든 트랜잭션이 정상적으로 처리된 경우에만 commit
					conn.commit();
				} catch (Exception e) {
					System.out.println("rollback");
					e.printStackTrace();
					conn.rollback();
				}finally {
					conn.close();
				}
			}  //end of if(next_sseq > 0)



			//--------------------------------------------
			// * DB close
			//--------------------------------------------

			//여기서 상품 올라왔는지 다시 뿌려줘야한다 list.
			response.sendRedirect("index.jsp");
		}

	}

}
