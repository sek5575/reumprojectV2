package com.reum.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.reum.common.MyBatisFactory;



@WebServlet("/updatePicServlet")
public class UpdatePicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String saveDirectory = "c://uploads/product";
		SqlSession conn = MyBatisFactory.getFactory().openSession();
		int maxPostSize = 1024 * 1024 * 10; //10M
		String encoding = "UTF-8";
		//--------------------------------------------
		// * c:/uploads 폴더에 파일카피 input/output Stream
		// * 중복파일 rename
		//--------------------------------------------
		MultipartRequest mrequest = new MultipartRequest(request,saveDirectory,maxPostSize,encoding,new DefaultFileRenamePolicy());
		
		//--------------------------------------------
		// * shop_info 관련 파라미터
		//--------------------------------------------
		String mainPic = mrequest.getParameter("mainPic");
		String addtionalPic = mrequest.getParameter("addtionalPic");
		
		System.out.println(mainPic + "mainPic");
		System.out.println(addtionalPic+ "addtionalPic");
		
		
	
		//--------------------------------------------
		// * shop_pic : cos.jar MultipartRequest를 이용한  멀티 파일업로드 처리
		// * <input type=pname1> <input type=pname2> name 여러개로 여러파일 올릴 경우   
		//--------------------------------------------
		ArrayList<ProductPicVO> pvolist  = new ArrayList<ProductPicVO>();
		Enumeration formNames = mrequest.getFileNames();
		while(formNames.hasMoreElements()) {
			String inputTagNames = (String)formNames.nextElement();
			//원본파일명
			String origPnames = mrequest.getOriginalFileName(inputTagNames);
			
			if(origPnames != null) {
				ProductPicVO pvo  = new ProductPicVO();
				//중복 시 리네임된 시스템 파일명
				String sysPnames = mrequest.getFilesystemName(inputTagNames);
				//파일크기
				//File pfiles = mrequest.getFile(inputTagNames); 
				//long attachFileSizes = pfiles.length();		
				pvo.setProductAttachPname(origPnames);
				pvo.setProductAttachSysname(sysPnames);
				
				System.out.println(origPnames + "origPnames");
				System.out.println(sysPnames + "sysPnames");
				
				if(pvolist.size() == 0) {
					pvo.setProductAttachMain("y");
				} else {
					pvo.setProductAttachMain("n");
				}
				pvolist.add(pvo);
			}
		}
	}

}
