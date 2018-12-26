package com.reum.users;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class LoginLogoutServlet
 */
@WebServlet("/login")
public class UsersLoginLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	//private Logger logger = Logger.getLogger(MemberServlet.class);   

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		HttpSession session = request.getSession();
		session.invalidate();
		session.setMaxInactiveInterval(0);//0초안에 지월져라아ㅏㅏㅏㅇ
		response.sendRedirect("index.jsp");
		
		
		

		//Logger.;
		//response.sendRedirect("http://google.com"); //밖에서 찾아서 가져오는것 
		//request.getRequestDispatcher("http://google.com").forward(request, response); //내 프로젝트 자원 가져오는것 , 밖에서 가져오지 못한다.
	
	}
	

	
	
//로그인
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("로그인");
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		
		UsersVO vo = new UsersVO();
		
		vo.setUserId(userid);
		vo.setUserPw(userpw);
	
		UsersDAO dao = new UsersDAO();//
		UsersVO uvo = dao.select(vo);
		
		if(uvo.getUserGubun() !=null || uvo.getUserGubun().equals("")) {
		
			//순서 -- page request session application
			
			HttpSession session = request.getSession();

			session.setAttribute("SESS_ID", uvo.getUserId());
			session.setAttribute("SESS_NAME", uvo.getUserName());
			session.setAttribute("SESS_GUBUN", uvo.getUserGubun());
			session.setAttribute("SESS_SEQ", uvo.getUserSeq());
			//session.setAttribute("SESS_FROFILE_IMG",uvo.getUser());
			//request.setAttribute("REQ_PNT", "1000");

/*			Cookie cname = new Cookie("COOKIE_NAME",uvo.getUserName());
			Cookie cgubun = new Cookie("COOKIE_GUBUN",uvo.getUserGubun());
			cname.setDomain("sh.com");
			cgubun.setDomain("sh.com");			
			cname.setMaxAge(60*30);//30분
			cgubun.setMaxAge(60*30);
			response.addCookie(cname);
	        response.addCookie(cgubun);
			*/
			
	        
			if(uvo.getUserGubun().equals("u")) {
				response.sendRedirect("index.jsp");
				//request. getRequestDispatcher("index.jsp");//.forward(request, response);
				//response.sendRedirect("index.jsp");
				System.out.println("성공");

			}else if (uvo.getUserGubun().equals("a")) {
				//request.getRequestDispatcher("admin/index.jsp").forward(request, response);
				response.sendRedirect("admin/index.jsp");
				System.out.println("admin 성공");
			}

		}else {

		System.out.println("실패");
		request.getRequestDispatcher("login.jsp").forward(request, response);
		
		
		
		
		}
		
		
	}

}
