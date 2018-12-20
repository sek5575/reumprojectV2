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

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.reum.common.MyBatisFactory;

@WebServlet("/productReplyUpdateServlet")
public class ProductReplyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		ProductDAO dao = new ProductDAO();
		
		HttpSession session = request.getSession();
		String sess_id = session.getAttribute("SESS_ID").toString();
		
		String jsonStr = request.getReader().lines().collect(Collectors.joining());	//전달된  Json데이터
		System.out.println(jsonStr);
		ProductReplyVO uvo = gson.fromJson(jsonStr, ProductReplyVO.class); 
		
		SqlSession conn = MyBatisFactory.getFactory().openSession();
		try {
			
			if(uvo.getProductReplyContent() != null) {
				int res = dao.updateReply(uvo, conn);
				System.out.println(res + "건 댓글 수정");
				System.out.println("수정된 댓글: "+uvo.getProductReplyContent());
			} else {
				int res = dao.deleteReply(uvo.getProductReplySeq(), conn);
				System.out.println(res + "건 댓글 삭제");
			}
			
			//좋은 코드는 아니다...
			ArrayList<ProductReplyVO> list = dao.selectReply(uvo.getProductSeq(), conn);
			for(ProductReplyVO vo : list) {
				vo.setSessionId(sess_id);
			}
			
			String gsonStr = gson.toJson(list);
			System.out.println(gsonStr);
			
			response.setContentType("application/json; charset=UTF-8"); //응답 데이터 타입:JSON
			PrintWriter out = response.getWriter();
			out.println(gsonStr);
			
		} catch(Exception e){
			e.getStackTrace();
		} finally {
			conn.close();
		}

			
	}

}
