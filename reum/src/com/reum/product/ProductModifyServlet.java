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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;
import com.reum.common.MyBatisFactory;
import com.reum.common.MyFileRenamePolicy;

/**
 * Servlet implementation class ProductModifyServlet
 */
@WebServlet("/productModifyServlet")
public class ProductModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String saveDirectory = "c://uploads/product";

		HttpSession session = request.getSession(); 
		String sess_id = session.getAttribute("SESS_ID").toString();  //sessionid가 없는 유저는 등록을 못하도록 막도록 코딩
		int productSeq = 0;

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
			ProductDAO dao = new ProductDAO();
			SqlSession conn = MyBatisFactory.getFactory().openSession();
			
			while ((part = parser.readNextPart()) != null) {
				ProductPicVO pvo = new ProductPicVO();
				String inputName = part.getName();
				if (part.isParam()) {
					ParamPart paramPart = (ParamPart)part;
					String value = paramPart.getStringValue();
//					System.out.println("inputName:" + inputName + "; value:" + value);
					if(inputName.equals("productSeq")) {
						productSeq = Integer.parseInt(value);	
					}
					
//					//서브이미지 담기
//					if(inputName.indexOf("old_nonmain_") != -1 && value != null) {  //서브이미지만 pvolist로 담는다.
//						String[] arr = value.split("#_#");
//						if(arr[0] != null) 
//							pvo.setProductAttachSeq(Integer.parseInt(arr[0]));
//						pvo.setProductAttachSysname(arr[1]);
//						pvo.setProductAttachPname(arr[2]);
//						pvo.setProductAttachMain("n");
//						pvolist.add(pvo);
//					}
					
					smap.put(inputName, value);
				} else if (part.isFile()) {
					
					FilePart filePart = (FilePart)part;
					//내가 정의한 파일 리네임 폴리시 사용....셋팅
					filePart.setRenamePolicy(pol);

					String fileName = filePart.getFileName();

					//파일업로드
					if (fileName != null) {
						//원본파일명
						//pvo.setPname(filePart.getFilePath());
						pvo.setProductAttachPname(filePart.getFileName());
						//파일 리네임명
						pvo.setProductAttachSysname(filePart.getFileName());
						//파일경로	
						pvo.setProductAttachPpath(saveDirectory);
						
						pvo.setProductSeq(productSeq);
						
						
//						4가지 경우의 수를 거쳐서 만들어야한다
//						새로운 사진이 들어오면 insert해야한다
//						리네임된 파일이름이랑 저장된 리네임 파일이름이랑 같으면 y가 아니다.
						if(pvolist.size() == 0) {
							pvo.setProductAttachMain("y");
						} else {
							pvo.setProductAttachMain("n");
						}

						//파일크기
						//pvo.setFileSize(fileSize);

						pvolist.add(pvo);  //새롭게 들어온 사진을 pvolist로 담는다. 
						System.out.println("222::" +pvolist.size());
					
					} 
				}
				
			} //end of while
			
			smap.put("pvolist", pvolist);
			System.out.println("333::" + pvolist.size());
			
			//--------------------------------------------
			// * DB Connection 
			//   트랙잭션 관리 : conn.setAutoCommit(false)
			//--------------------------------------------
			

			//--------------------------------------------
			// 1. CURRVAL+1 SSEQ 가져오기
			//--------------------------------------------
			if(productSeq != 0) {
				try {
					// 2. DB저장작업
					//    SHOP_INFO 테이블 정보 입력 : 1번 입력
					//--------------------------------------------
//					if(smap.get("old_mainsysname") != null) {   //main 수정 ==> atseq 받아야한다.
//						ProductPicVO mvo = dao.selectMainseq(productSeq, conn); //문제발생
////						mvo.setProductAttachSeq(productAttachSeq);
//						mvo.setProductAttachPname(smap.get("old_mainpname").toString());
//						mvo.setProductAttachSysname(smap.get("old_mainsysname").toString());
//						mvo.setProductAttachMain("y");
//						int res = dao.productOrigin(mvo, conn); //4?
//						System.out.println("메인사진 "+res+"건");
//					}
					
					Gson gson = new Gson();
					JsonElement jsonElement = gson.toJsonTree(smap);      //smap의 이름과 product_register의 name값이 일치해야 VO도 일치하기 때문에 값이 들어온다.
					ProductVO svo = gson.fromJson(jsonElement, ProductVO.class);  //svo에 수정 text와 pvolist가 담겨있다.
								
					int updateRes = dao.productUpdate(svo, conn);  // product에 사진이외의 정보 업데이트
					System.out.println(updateRes + "건 사진이외의 정보 업데이트");
					
					//--------------------------------------------
					// 3. DB저장작업
					//    SHOP_PIC 테이블 정보 입력 : pvolist.size()번 입력
					//--------------------------------------------
					if(svo.getPvolist().size() != 0) { // 사진 수정을 했을 때.
						if(smap.get("old_mainsysname") != null) {//메인사진을 수정을 안한다면  pvolist.size() ==> 첨부파일만  -->  1.첨부사진만 수정
							for(int i=0; i<svo.getPvolist().size(); i++) {
								svo.getPvolist().get(i).setProductAttachMain("n");
								svo.getPvolist().get(i).setProductSeq(productSeq);
							}
							
							ArrayList<ProductPicVO> atlist = dao.selectAttachSeq(productSeq, conn);
							int atres = 0;
							for(int i=0; i<atlist.size(); i++) {
								atres += dao.productPicChange(atlist.get(i), conn);
							}
							System.out.println(atres+"개의 사진 change로 변경");

							int attachres = 0;
							for(int i=0; i<svo.getPvolist().size(); i++) {
								attachres += dao.insertProductPic(svo.getPvolist().get(i), conn);
							}
							System.out.println(attachres + "개의 사진 insert");

						} else { //메인사진을 수정한다면  -->  2.메인사진만 수정  3.메인사진과 첨부사진 둘다 수정 
							if(svo.getPvolist().size() == 1) { //2.메인사진만 수정
								ProductPicVO mvo = dao.selectMainSeq(productSeq, conn);
								int mainchres = dao.productPicChange(mvo, conn);
								System.out.println(mainchres + "개의 메인사진 change로 변경");	
								
								int mainres = dao.insertProductPic(svo.getPvolist().get(0), conn); //불안하다
								System.out.println(mainres + "개의 메인사진 insert");
							}else { //3.메인사진과 첨부사진 둘다 수정
								ArrayList<ProductPicVO> list = dao.selectAllPicSeq(productSeq, conn);
								int allchres = 0;
								for(int i=0; i<list.size(); i++) {
									allchres += dao.productPicChange(list.get(i), conn);
								}
								System.out.println(allchres + "개의 모든 사진 change로 변경");
								
								int allres = 0;
								for(int i=0; i<svo.getPvolist().size(); i++) {
									allres += dao.insertProductPic(svo.getPvolist().get(i), conn);
								}
								System.out.println(allres+"개의 모든 사진 insert");
							}
							
						}
					} else {
						System.out.println("사진 수정 안함.");
					}
					
				
					
				} catch (Exception e) {
					System.out.println("rollback");
					e.printStackTrace();
					conn.rollback();
				}finally {
					conn.close();
				}
			} //end of if(next_sseq > 0)



			//--------------------------------------------
			// * DB close
			//--------------------------------------------
			response.sendRedirect("products.jsp");
			
		}
	}

}
