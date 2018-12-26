package com.reum.users;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reum.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * Servlet implementation class MemberEditServlet
 */
@WebServlet("/edit")
public class UsersEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//DB 회원정보 조회 후 /profile.jsp 이동
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("SESS_ID") == null) {
			response.sendRedirect("login.jsp");
		} else {
			String sess_id = session.getAttribute("SESS_ID").toString();
					
			UsersDAO mdao = new UsersDAO();
			UsersVO mvo = mdao.select(sess_id);
			
			if(mvo.getUserGubun() == null || mvo.getUserGubun().equals(""))  {
				response.sendRedirect("/404.jsp");
			} else {
				request.setAttribute("USERS", mvo);
				request.getRequestDispatcher("modify.jsp").forward(request, response);			
			}
		}
	}
	
	
	// profile.jsp에서 수정버튼 클릭 시 DB 수정 작업
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UsersVO mvo = new UsersVO();
		if(session.getAttribute("SESS_ID") == null) {
			response.sendRedirect("login.jsp");
		} else {
			String sess_id = session.getAttribute("SESS_ID").toString();
			mvo.setUserId(sess_id);		
		}
		
		String saveDirectory = "C:/uploads/profile";
		int maxPostSize = 1024 * 1024 * 10; //10M
		String encoding = "UTF-8";		
		FileRenamePolicy policy = new MyFileRenamePolicy();
		MultipartRequest mrequest = new MultipartRequest(request,saveDirectory,maxPostSize,encoding,policy);
	
		String origPname = mrequest.getOriginalFileName("userPname");
		String sysPname = "";	
	
		if(origPname == null) {
				origPname = mrequest.getParameter("userOldPname");
				sysPname = mrequest.getParameter("userOldSysname");
				saveDirectory = mrequest.getParameter("userOldPPath");
				mvo.setUserPpath(saveDirectory);
				mvo.setUserPname(origPname);
				mvo.setUserSysname(sysPname);
		
		} else {
				
				sysPname = mrequest.getFilesystemName("userPname");				
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
				mvo.setUserPpath(saveDirectory);
				mvo.setUserPname(origPname);
				mvo.setUserSysname(sysPname);				
		}			

		String userName = mrequest.getParameter("userName");
		String userPw = mrequest.getParameter("userPw");
		String userEmail = mrequest.getParameter("userEmail");
		String userPost = mrequest.getParameter("userPost");
		String userAddress = mrequest.getParameter("userAddress");
		String userDetailAddress = mrequest.getParameter("userDetailAddress");
	
		mvo.setUserName(userName);
		mvo.setUserPw(userPw);
		mvo.setUserEmail(userEmail);
		mvo.setUserPost(userPost);
		mvo.setUserAddress(userAddress);
		mvo.setUserDetailAddress(userDetailAddress);	
		UsersDAO dao = new UsersDAO();
		int res = dao.update(mvo);
		if(res > 0) {
			response.sendRedirect("/index.jsp");
		} else {
			response.sendRedirect("404.jsp");
		}
	}

}
