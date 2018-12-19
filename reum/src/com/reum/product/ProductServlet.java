package com.reum.product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.reum.common.MyBatisFactory;
import com.reum.users.UsersDAO;
import com.reum.users.UsersVO;

/**
 * Servlet implementation class ProductDetail
 */
@WebServlet("/product")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int seq = Integer.parseInt(request.getParameter("product_seq"));	
		ProductDAO dao = new ProductDAO();
		System.out.println(seq+"=상품Detail에서 seq");
		
		SqlSession conn = MyBatisFactory.getFactory().openSession();
		
		try {
			ProductVO vo = dao.selectDetail(seq, conn);
			System.out.println("대표사진:"+vo.getProductPicVO().getProductAttachSysname());
			
			ProductVO deso = dao.selectDescription(seq, conn); 
			System.out.println("첨부사진개수:"+deso.getPvolist().size());
			
			ArrayList<ProductReplyVO> list = dao.selectReply(seq, conn);
			System.out.println("댓글개수:"+list.size());
			
			ArrayList<ProductEvalVO> eval = dao.selectEval(seq, conn);
			System.out.println("평가개수:"+eval.size());
			
			UsersDAO uao = new UsersDAO();
			SellerVO svo = dao.selectSeller(seq, conn); //svo -> seller_seq=null
			UsersVO uid = uao.selectSellerId(svo.getSellerSeq(), conn);  //uid -> seller_id
			System.out.println(uid.getUserId());
			
			request.setAttribute("Product_EVAL", eval);
			request.setAttribute("Product_REPLY", list);
			request.setAttribute("Product_PIC", deso);
			request.setAttribute("Product_VO", vo);
			request.setAttribute("Seller_ID", uid);
			request.getRequestDispatcher("product_details.jsp").forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		

		
		
		
		
	}


}
