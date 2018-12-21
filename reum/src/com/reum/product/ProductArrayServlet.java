package com.reum.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

/**
 * Servlet implementation class ProductArrayServlet
 */
@WebServlet("/productArrayServlet")
public class ProductArrayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		ProductDAO dao = new ProductDAO();
		
		String jsonStr = request.getReader().lines().collect(Collectors.joining());	//전달된  Json데이터
		System.out.println(jsonStr);
		ProductVO avo = gson.fromJson(jsonStr, ProductVO.class);  //vo로
		System.out.println("정렬 기준: "+avo.getMode());
		
		ArrayList<ProductVO> list = dao.selectProductList(avo);
		
		String gsonStr = gson.toJson(list);							//String변환
		System.out.println(gsonStr);
		
		response.setContentType("application/json; charset=UTF-8"); //응답 데이터 타입:JSON
		PrintWriter out = response.getWriter();
		out.println(gsonStr);
		
	}

}
