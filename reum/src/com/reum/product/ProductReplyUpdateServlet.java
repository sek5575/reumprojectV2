package com.reum.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.Gson;

@WebServlet("/productReplyUpdateServlet")
public class ProductReplyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		ProductDAO dao = new ProductDAO();
		
		String jsonStr = request.getReader().lines().collect(Collectors.joining());	//전달된  Json데이터
		System.out.println(jsonStr);
		ProductReplyVO uvo = gson.fromJson(jsonStr, ProductReplyVO.class); 
		System.out.println("수정 전 댓글 내용: "+uvo.getProductReplyContent());
		
		int res = dao.updateReply(uvo);
		System.out.println(res + "건 댓글 수정");
		
		ProductReplyVO rvo = dao.RelevantReply(uvo.getProductReplySeq());
		System.out.println("수정 댓글 내용: " +rvo.getProductReplyContent() + " " +rvo.getProductReplySeq());
		
		String gsonStr = gson.toJson(rvo);
		System.out.println(gsonStr);
			
		response.setContentType("application/json; charset=UTF-8"); //응답 데이터 타입:JSON
		PrintWriter out = response.getWriter();
		out.println(gsonStr);
			
	}

}
