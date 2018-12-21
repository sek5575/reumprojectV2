package com.reum.product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductSideServlet
 */
@WebServlet("/productSideServlet")
public class ProductSideServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cseq = Integer.parseInt(request.getParameter("cate_seq"));
		String array = request.getParameter("array");
		String productName = request.getParameter("product_name");
		System.out.println(productName+" 으로 검색");
		//System.out.println(array + "======");
		
		ProductVO vo = new ProductVO();
		vo.setCateSeq(cseq);
		vo.setMode(array);
		
		ProductDAO dao = new ProductDAO();
		ArrayList<ProductVO> list = dao.selectProductList(vo);
		ArrayList<LocationVO> lolist = dao.selectLocation();
		ArrayList<ProductVO> slist = dao.productSearch(productName); //검색 조건이 없으면..
		
		request.setAttribute("Product_LIST", list);
		request.setAttribute("Location_LIST", lolist);
		request.setAttribute("Search_LIST", slist);
		request.getRequestDispatcher("product_list.jsp").forward(request, response);
	}

}
