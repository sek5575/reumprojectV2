package com.reum.users;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reum.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class UsersRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String saveDirectory = "C:/uploads/profile";
		int maxPostSize = 1024 * 1024 * 10; //10M
		String encoding = "UTF-8";
		FileRenamePolicy policy = new MyFileRenamePolicy();
		
		MultipartRequest mrequest = new MultipartRequest(request,saveDirectory,maxPostSize,encoding,policy);
		
		String origPname = mrequest.getOriginalFileName("userPname");	
		String sysPname = mrequest.getFilesystemName("userPname");
		String attachFileExt = "jpg";
		if(origPname.lastIndexOf(".") != -1) {
			attachFileExt = origPname.substring(origPname.lastIndexOf(".")+1);
		}
		if(!attachFileExt.toUpperCase().equals("JPG") &&
				!attachFileExt.toUpperCase().equals("PNG") &&
				!attachFileExt.toUpperCase().equals("GIF")
		) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미지 첨부만 가능')</script>");		
		}
		
		String userId = mrequest.getParameter("userId");
		String userPw = mrequest.getParameter("userPw");
		String userName = mrequest.getParameter("userName");
		String userEmail = mrequest.getParameter("userEmail");
		String userPhone = mrequest.getParameter("userPhone");
		String userPost = mrequest.getParameter("userPost");
		String userAddress = mrequest.getParameter("userAddress");
		String userDetailAddress = mrequest.getParameter("userDetailAddress");
		String userLat = mrequest.getParameter("userLat");
		String userLng = mrequest.getParameter("userLng");
	
		
	
		UsersVO mvo = new UsersVO();
		mvo.setUserId(userId);
		mvo.setUserPw(userPw);
		mvo.setUserName(userName);		
		mvo.setUserEmail(userEmail);
		mvo.setUserPpath(saveDirectory);
		mvo.setUserPname(origPname);
		mvo.setUserSysname(sysPname);
		mvo.setUserPhone(userPhone);
		mvo.setUserPost(userPost);		
		mvo.setUserAddress(userAddress);
		mvo.setUserDetailAddress(userDetailAddress);
		mvo.setUserLat(userLat);
		mvo.setUserLng(userLng);
		
		UsersDAO dao = new UsersDAO();
		int res = dao.insert(mvo);
		if(res > 0) {
			response.sendRedirect("login.jsp");
		} else {
			response.sendRedirect("404.jsp");
		}
	}

}
