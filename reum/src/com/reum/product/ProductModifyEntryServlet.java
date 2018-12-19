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
 * Servlet implementation class ProductModifyServlet
 */
@WebServlet("/productModifyEntryServlet")
public class ProductModifyEntryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int seq = Integer.parseInt(request.getParameter("product_seq"));
		System.out.println(seq+"=상품Modify에서 seq");
		
		SqlSession conn = MyBatisFactory.getFactory().openSession();
		
		try {
			ProductDAO dao = new ProductDAO();
			ProductVO vo = dao.selectDetail(seq, conn);
			System.out.println("대표사진:"+vo.getProductPicVO().getProductAttachSysname());
			
			ProductVO deso = dao.selectDescription(seq, conn); 
			System.out.println("첨부사진개수:"+deso.getPvolist().size());
			
			request.setAttribute("Product_PIC", deso);
			request.setAttribute("Product_VO", vo);
			request.getRequestDispatcher("product_modify.jsp").forward(request, response);
			
		} catch(Exception e){
			e.getStackTrace();
		} finally {
			conn.close();
		}
		
	}

}
