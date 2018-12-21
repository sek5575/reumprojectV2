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
@WebServlet("/productLocArrayServlet")
public class ProductLocArrayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		ProductDAO dao = new ProductDAO();
		
		String jsonStr = request.getReader().lines().collect(Collectors.joining());	//전달된  Json데이터
		System.out.println(jsonStr);
		ProductVO avo = gson.fromJson(jsonStr, ProductVO.class);  //vo로
		
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		System.out.println(avo.getLocName());

		
		if(avo.getLocName().equals("서울")) {
			list = dao.selectLocationList(avo.getLocName());
		}else if(avo.getLocName().equals("광주")) {
			list = dao.selectLocationList(avo.getLocName());
		}else if(avo.getLocName().equals("대전")) {
			list = dao.selectLocationList(avo.getLocName());
		}else if(avo.getLocName().equals("부산")) {
			list = dao.selectLocationList(avo.getLocName());
		}else if(avo.getLocName().equals("울산")) {
			list = dao.selectLocationList(avo.getLocName());
		}else if(avo.getLocName().equals("인천")) {
			list = dao.selectLocationList(avo.getLocName());
		}else if(avo.getLocName().equals("제주도")) {
			list = dao.selectLocationList(avo.getLocName());
		}else if(avo.getLocName().equals("울릉도")) {
			list = dao.selectLocationList(avo.getLocName());
		}else if(avo.getLocName().equals("독도")) {
			list = dao.selectLocationList(avo.getLocName());
		}
		else {
			System.out.println("error");
		}
		
		String gsonStr = gson.toJson(list);							//String변환
		System.out.println(gsonStr);
		
		response.setContentType("application/json; charset=UTF-8"); //응답 데이터 타입:JSON
		PrintWriter out = response.getWriter();
		out.println(gsonStr);
		
	}

}
