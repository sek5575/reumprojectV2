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
@WebServlet("/del")
public class UsersDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// profile.jsp에서 회원탈퇴 클릭 시 DB 수정 작업
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		
		HttpSession session = request.getSession();
		String sess_id = "";
		if(session.getAttribute("SESS_ID") == null) {
			response.sendRedirect("login.jsp");
		} else {
			sess_id = session.getAttribute("SESS_ID").toString();		
		}			
		
		UsersDAO dao= new UsersDAO();
		int res = dao.delete(sess_id);
		if(res > 0) {
			//로그아웃 처리 후 index.jsp 페이지로 이동
			response.sendRedirect("/login");
		} else {
			response.sendRedirect("404.jsp");
		}
	}

}
