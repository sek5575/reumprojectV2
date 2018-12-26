package com.reum.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.reum.common.PagingUtil;

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
		ProductVO avo = gson.fromJson(jsonStr, ProductVO.class);  // ==> null로 들어온다.....
		System.out.println("정렬 기준: "+avo.getMode());
		
		
		
//		int currentPage = 1;
//		currentPage = avo.getCurrentPage();
//		//전체 게시물 수
//		int totalCnt = dao.selectCount();  //카운트 현재 9개
//		
//		int cseq = Integer.parseInt(request.getParameter("cate_seq"));
//		String array = request.getParameter("array");
//		avo.setMode(array);
//		
//		int blockCount = 3;   //한 블럭의 게시물 수		5
//		int blockPage = 3;    //한화면에 보여질 블럭 수		6    눌렀을때 ArrayServlet으로 간다..
//		PagingUtil page  = new PagingUtil("/productArrayServlet?cate_seq="+cseq+"&array="+array+"", currentPage, totalCnt, blockCount, blockPage);
//		String pagingHtml = page.getPagingHtml();
//		
//		//전체목록
//		avo.setStartSeq(page.getStartSeq());
//		avo.setEndSeq(page.getEndSeq()); 
//		System.out.println(page.getStartSeq() +" 시작  Seq");
//		System.out.println(page.getEndSeq() +" 끝 Seq");
//		ArrayList<ProductVO> pageList = dao.selectPagingProductList(avo);
//		
//		
//		request.setAttribute("Product_LIST", pageList);
//		request.setAttribute("Page_HTML", pagingHtml);
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("MAP_LIST", pageList);
//		map.put("MAP_PAGING", pagingHtml);
//		String gsonStr = gson.toJson(map);	
		
		
		ArrayList<ProductVO> list = dao.selectProductList(avo);
		String gsonStr = gson.toJson(list);							//String변환
		
		System.out.println(gsonStr);
		
		response.setContentType("application/json; charset=UTF-8"); //응답 데이터 타입:JSON
		PrintWriter out = response.getWriter();
		out.println(gsonStr);
		
	}

}
