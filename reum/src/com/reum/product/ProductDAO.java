package com.reum.product;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.reum.common.MyBatisFactory;


public class ProductDAO {
	
	public ArrayList<ProductVO> productSearch(String name) {
		SqlSession conn = null;
		ArrayList<ProductVO> list = null;
		try {
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("productSpace.productSearch", name);
		} finally {
			conn.close();
		}
		return list;	
	}

	public ArrayList<ProductVO> selectProductList(ProductVO pvo) {
		SqlSession conn = null;
		ArrayList<ProductVO> list = null;
		try {
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("productSpace.selectProductList", pvo);
		} finally {
			conn.close();
		}
		return list;	
	}
	
	public ArrayList<ProductVO> selectLocationList(String loc) {
		SqlSession conn = null;
		ArrayList<ProductVO> list = null;
		try {
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("productSpace.selectLocationList", loc);
		} finally {
			conn.close();
		}
		return list;	
	}
	
	
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
	
	public int productDelete(ProductVO vo, SqlSession PRMCONN) {
		int	res = PRMCONN.update("productSpace.productDelete", vo);
		PRMCONN.commit();
		return res;
	}

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
	
	public int updateReply(ProductReplyVO vo, SqlSession PRMCONN) {
			int res = PRMCONN.update("productSpace.updateReply", vo);
			PRMCONN.commit();
		return res;
	}
	
	public int deleteReply(int seq, SqlSession PRMCONN) {
			int res = PRMCONN.update("productSpace.deleteReply", seq);
			PRMCONN.commit();
		return res;
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
	
	public ArrayList<LocationVO> selectLocation() {
		SqlSession conn = null;
		ArrayList<LocationVO> list = null;
		try {
			conn = MyBatisFactory.getFactory().openSession();
			list = (ArrayList)conn.selectList("productSpace.selectLocation");
		} finally {
			conn.close();
		}
		return list;
	}
	


}
