package com.reum.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.reum.common.PagingUtil;

/**
 * Servlet implementation class ProductPagingServlet
 */
@WebServlet("/productPagingServlet")
public class ProductPagingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		ProductDAO dao = new ProductDAO();
		
		HashMap<String, Object> map = new HashMap();
		int currentPage = 1;
		//currentPage = vo.getCurrentPage();
		
		if(request.getParameter("currentPage") != null) {
    		currentPage = Integer.parseInt(request.getParameter("currentPage"));
    	}
		System.out.println("currentPage" + currentPage);
		
		//전체 게시물 수
		int totalCnt = dao.selectCount();  //카운트 현재 9개
		
		int blockCount = 3;   //한 블럭의 게시물 수		5
		int blockPage = 3;    //한화면에 보여질 블럭 수		6
		PagingUtil page  = new PagingUtil("/productPagingServlet?cate_seq="+avo.getCateSeq()+"", currentPage, totalCnt, blockCount, blockPage);
		String pagingHtml = page.getPagingHtml();
		map.put("MAP_PAGING", pagingHtml); 
		
		//전체목록
		avo.setStartSeq(page.getStartSeq());
		avo.setEndSeq(page.getEndSeq());
		System.out.println(page.getStartSeq() +" 시작  Seq");
		System.out.println(page.getEndSeq() +" 끝 Seq");
		ArrayList<ProductVO> pageList = dao.selectProductList(avo);
		map.put("MAP_LIST", pageList);
		
		String gsonStr = gson.toJson(map);
		response.setContentType("application/json; charset=UTF-8"); //응답 데이터 타입:JSON
		PrintWriter out = response.getWriter();
		out.println(gsonStr);
		
	}



}
