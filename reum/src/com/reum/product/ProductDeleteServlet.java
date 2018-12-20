package com.reum.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.reum.common.MyBatisFactory;

/**
 * Servlet implementation class ProductDeleteServlet
 */
@WebServlet("/productDeleteServlet")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int seq = Integer.parseInt(request.getParameter("product_seq"));
		SqlSession conn = MyBatisFactory.getFactory().openSession();
		try {
			ProductDAO dao = new ProductDAO();
			ProductVO vo = dao.selectDetail(seq, conn);
			
			int res = dao.productDelete(vo, conn);
			System.out.println(res + "건 삭제완료");
			
			response.sendRedirect("products.jsp");
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}

}
