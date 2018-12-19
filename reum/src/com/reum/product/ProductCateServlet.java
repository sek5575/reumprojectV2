package com.reum.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class ProductCateServlet
 */
@WebServlet("/productCateServlet")
public class ProductCateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cate = 0;
		if(request.getParameter("cate") != null)
			cate = Integer.parseInt(request.getParameter("cate"));
		
		ProductDAO dao = new ProductDAO();
		ArrayList<CateGoryVO> list = dao.selectCate(cate);
		Gson gson = new Gson();
		String gsonStr = gson.toJson(list);
		System.out.println(gsonStr);
		
		response.setContentType("application/json; charset=UTF-8"); //응답 데이터 타입:JSON
		PrintWriter out = response.getWriter();
		out.println(gsonStr);
	
		
	}

}
