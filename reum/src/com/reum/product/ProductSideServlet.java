package com.reum.product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reum.common.PagingUtil;

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
		//System.out.println(productName+" 으로 검색");
		System.out.println(array + "======");
		
		ProductVO vo = new ProductVO();
		vo.setCateSeq(cseq);
		vo.setMode(array);
		
		ProductDAO dao = new ProductDAO();
		
		
		
//		int currentPage = 1;
//		//currentPage = vo.getCurrentPage();
//		//전체 게시물 수
//		int totalCnt = dao.selectCount();  //카운트 현재 9개
//		
//		int blockCount = 3;   //한 블럭의 게시물 수		5
//		int blockPage = 3;    //한화면에 보여질 블럭 수		6    눌렀을때 ArrayServlet으로 간다..
//		PagingUtil page  = new PagingUtil("/productArrayServlet?cate_seq="+cseq+"&array="+array+"", currentPage, totalCnt, blockCount, blockPage);
//		String pagingHtml = page.getPagingHtml();
//		
//		//전체목록
//		vo.setStartSeq(page.getStartSeq());
//		vo.setEndSeq(page.getEndSeq());
//		System.out.println(page.getStartSeq() +" 시작  Seq");
//		System.out.println(page.getEndSeq() +" 끝 Seq");
//		ArrayList<ProductVO> pageList = dao.selectPagingProductList(vo);
//		
//		
//		request.setAttribute("Product_LIST", pageList);
//		request.setAttribute("Page_HTML", pagingHtml);
		
		
		ArrayList<ProductVO> list = dao.selectProductList(vo);
		ArrayList<LocationVO> lolist = dao.selectLocation();
		ArrayList<ProductVO> slist = dao.productSearch(productName); //검색 할때 뿌려주는 list
		
		request.setAttribute("Product_LIST", list);
		request.setAttribute("Location_LIST", lolist);
		request.setAttribute("Search_LIST", slist);
		request.getRequestDispatcher("product_list.jsp").forward(request, response);
	}

}
