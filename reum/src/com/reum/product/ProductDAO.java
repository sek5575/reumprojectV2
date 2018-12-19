package com.reum.product;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.reum.common.MyBatisFactory;


public class ProductDAO {
	
	public ProductVO selectDetail(int seq, SqlSession PRMCONN) {
		ProductVO vo = PRMCONN.selectOne("productSpace.selectDetail", seq);
		return vo;	
	}
	

	public ProductVO selectDescription(int seq, SqlSession PRMCONN) {
		ProductVO vo = PRMCONN.selectOne("productSpace.selectDescription", seq);
		return vo;	
	}
	
	public ArrayList<ProductReplyVO> selectReply(int seq, SqlSession PRMCONN) {
		ArrayList<ProductReplyVO> list = (ArrayList)PRMCONN.selectList("productSpace.selectReply", seq);
		return list;	
	}
	
//	public productDelete

	public int insertReply(ProductReplyVO vo) {
		SqlSession conn = null;
		int res=0;
		try {
			conn = MyBatisFactory.getFactory().openSession();
			res = conn.insert("productSpace.insertReply", vo);
			conn.commit();
		} finally {
			conn.close();
		}
		return res;
	}
	
	public int updateReply(ProductReplyVO vo) {
		SqlSession conn = null;
		int res=0;
		try {
			conn = MyBatisFactory.getFactory().openSession();
			res = conn.update("productSpace.updateReply", vo);
			conn.commit();
		} finally{
			conn.close();
		}
		return res;
	}
	
	public ProductReplyVO RelevantReply(int seq) {
		SqlSession conn = null;
		ProductReplyVO vo = null;
		try {
			conn = MyBatisFactory.getFactory().openSession();
			vo = conn.selectOne("productSpace.RelevantReply", seq);
			conn.commit();
		} finally{
			conn.close();
		}
		return vo;
	}
	
	public ArrayList<ProductEvalVO> selectEval(int seq, SqlSession PRMCONN) {
		ArrayList<ProductEvalVO> list = (ArrayList)PRMCONN.selectList("productSpace.selectEval", seq);
		return list;	
	}
	
	public int selectNextSseq(SqlSession PRMCONN) {
		int next_sseq = PRMCONN.selectOne("productSpace.selectNextSseq");
		return next_sseq;
	}
	
	public int selectMaxSeq(SqlSession PRMCONN) {
		int max_sseq = PRMCONN.selectOne("productSpace.selectMaxSeq");
		return max_sseq;
	}
	
	public int insertProductInfo(ProductVO svo, SqlSession PRMCONN) {  //글 내용부분
		int res = PRMCONN.insert("productSpace.insertProductInfo", svo);
		PRMCONN.commit();
		return res;	
	}
	
	
	public int insertProductPic(ProductPicVO svo, SqlSession PRMCONN) {  //사진
		int res = PRMCONN.insert("productSpace.insertProductPic", svo);
		PRMCONN.commit();
		return res;	
	}
	
	public int insertSeller(SellerVO svo, SqlSession PRMCONN) {
		int res = PRMCONN.insert("productSpace.insertSeller", svo);
		PRMCONN.commit();
		return res;
	}
	
	public ArrayList<CateGoryVO> selectCate(int seq) {
		SqlSession conn = null;
		ArrayList<CateGoryVO> list = null;
		
		try {
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("productSpace.selectCate", seq);
		} finally {
			conn.close();
		}
		return list;	
	}
	
	
	public int productUpdate(ProductVO vo, SqlSession PRMCONN) {
		int res = PRMCONN.update("productSpace.productUpdate", vo);
		PRMCONN.commit();
		return res;
	}
	
	
	public int productOrigin(ProductPicVO vo, SqlSession PRMCONN) {
		int res = PRMCONN.update("productSpace.productOrigin", vo);
		PRMCONN.commit();
		return res;
	}

	
	
	
	
	public ArrayList<ProductPicVO> selectAttachSeq(int seq, SqlSession PRMCONN) {
		ArrayList<ProductPicVO> list = (ArrayList)PRMCONN.selectList("productSpace.selectAttachSeq", seq);
		return list;
	}
	
	public ProductPicVO selectMainSeq(int seq, SqlSession PRMCONN) {
		ProductPicVO vo = PRMCONN.selectOne("productSpace.selectMainSeq", seq);
		return vo;
	}
	
	public ArrayList<ProductPicVO> selectAllPicSeq(int seq, SqlSession PRMCONN) {
		ArrayList<ProductPicVO> list = (ArrayList)PRMCONN.selectList("productSpace.selectAllPicSeq", seq);
		return list;
	}
	
	public int productPicChange(ProductPicVO vo, SqlSession PRMCONN) {
		int res = PRMCONN.update("productSpace.productPicChange", vo);
		PRMCONN.commit();
		return res;
	}
	
	
	public SellerVO selectSeller(int seq, SqlSession PRMCONN) {
		SellerVO vo = PRMCONN.selectOne("productSpace.selectSeller", seq);
		return vo;
	}
	
//	public int mainPicChange(ProductPicVO vo, SqlSession PRMCONN) {
//		int res = 0;
//		try {
//			res = PRMCONN.update("productSpace.mainPicChange", vo);
//			PRMCONN.commit();
//		}finally {
//			PRMCONN.close();
//		}
//		return res;
//	}
	
	
//	public ProductVO selectReply(int seq) {
//		SqlSession conn = null;
//		ProductVO vo = null;
//		
//		try {
//			conn = MyBatisFactory.getFactory().openSession();
//			vo = conn.selectOne("productSpace.selectReply", seq);
//		} finally {
//			conn.close();
//		}
//		return vo;	
//	}
	
	


}
