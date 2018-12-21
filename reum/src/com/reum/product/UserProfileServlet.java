package com.reum.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserProfileServlet
 */
@WebServlet("/userProfileServlet")
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productSeq = request.getParameter("product_seq");
		
		
		
//		 	PrintWriter out = res.getWriter();
//
//		    out.println("<script language='javascript'>");
//		    out.println("mywin = window.open('/searchemail.jsp?emailuse="+memtype+"&email="+email+"','CheckEmail','width=434,height=137');");
//		    out.println("</script>");
	}

}
