package com.reum.users;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/pwcheck")
public class UsersPwCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//비밀번호 체크 -------------------------------
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		HttpSession session = request.getSession();
		if(session.getAttribute("SESS_ID") == null) {
			response.sendRedirect("login.jsp");
		} else {
			String sess_id = session.getAttribute("SESS_ID").toString();
			String userPw = request.getParameter("userpw");
			
			UsersVO mvo = new UsersVO();
			mvo.setUserId(sess_id);
			mvo.setUserPw(userPw);
			
			UsersDAO mdao = new UsersDAO();
			mvo = mdao.select(mvo);		//로그인과 상동(id/pw)
			
			
			if(mvo.getUserGubun() == null || mvo.getUserGubun().equals(""))  {
				response.sendRedirect("pwcheck.jsp"); 
			} else {
				//수정()/삭제(del)
				String mode = request.getParameter("mode");
				//회원탈퇴 처리
				if(mode.equals("del")) {
					response.sendRedirect("/del");
				System.out.println("삭제");
				} else {
					response.sendRedirect("/edit");	
					System.out.println("수정");
				}
			}
		}
	}

}
