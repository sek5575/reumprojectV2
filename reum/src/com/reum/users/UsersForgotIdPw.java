package com.reum.users;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.reum.users.UsersDAO;
import com.reum.users.UsersVO;

@WebServlet("/forgot")
public class UsersForgotIdPw extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("아이디 찾기");
		String userphone = request.getParameter("userphone");
		
		
		UsersVO vo = new UsersVO();
		

		vo.setUserPhone(userphone);
	
		UsersDAO dao = new UsersDAO();//
		UsersVO uvo = dao.select(vo);
		
	/*	if(uvo.getUser_gubun() !=null || uvo.getUser_gubun().equals("")) {
		
			//순서 -- page request session application
			
			HttpSession session = request.getSession();

			session.setAttribute("SESS_ID", uvo.getUser_id());
			session.setAttribute("SESS_NAME", uvo.getUser_name());
			session.setAttribute("SESS_GUBUN", uvo.getUser_gubun());
			session.setAttribute("SESS_FROFILE_IMG",uvo.getUser_ppath());
			request.setAttribute("REQ_PNT", "1000");
			
		}*/
	}
}
