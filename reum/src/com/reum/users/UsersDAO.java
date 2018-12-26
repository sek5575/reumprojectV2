package com.reum.users;

import org.apache.ibatis.session.SqlSession;


import com.reum.common.MyBatisFactory;



public class UsersDAO {
	
	/**
	 * 회원 가입
	 * @param mvo
	 * @return
	 */
	public int insert(UsersVO mvo) {
		SqlSession conn =null;
		int res = 0;
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			res = conn.insert("usersSpace.users_register", mvo);
			conn.commit();
		} finally {
			conn.close();
		}
		return res;
	}
	/**
	 * 로그인 정보 가져오기
	 * @param uvo
	 * @return
	 */
	public UsersVO select(UsersVO uvo) {  //login
		SqlSession conn =null;
		UsersVO vo = null;
		
		try {
			conn = MyBatisFactory.getFactory().openSession();
			vo = conn.selectOne("usersSpace.users_login", uvo);
		} finally {
			conn.close();
		}
		return vo;
	}
	/**
	 * 회원정보 수정
	 * @param mvo
	 * @return
	 */
	public int update(UsersVO mvo) {
		SqlSession conn =null;
		int res = 0;
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			res = conn.update("usersSpace.users_update", mvo);
			conn.commit();
		} finally {
			conn.close();
		}
		return res;
	}
	
	
	/**
	 * 회원 탈퇴 : USER_GUBUN='0' / USER_DEL='y'
	 * @param userId
	 * @return
	 */
	public int delete(String userId) {
		SqlSession conn =null;
		int res = 0;
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			res = conn.update("usersSpace.users_delete",userId);
			conn.commit();
		} finally {
			conn.close();
		}
		return res;
	}
	
	/**
	 * 회원 정보 수정을 위한 모든 정보 가져오기
	 * @param userId
	 * @return
	 */
	public UsersVO select(String userId) {
		UsersVO mvo = new UsersVO();
		SqlSession conn =null;
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			mvo = conn.selectOne("usersSpace.users_detail",userId);
		} finally {
			conn.close();
		}
		return mvo;
	}
	public UsersVO selectUserSeq(String sessionId, SqlSession PRMCONN) {
		UsersVO vo = PRMCONN.selectOne("usersSpace.selectUserSeq", sessionId);
		return vo;
	}
	
	public UsersVO selectSellerId(int seq, SqlSession PRMCONN) {
		UsersVO vo = PRMCONN.selectOne("usersSpace.selectSellerId", seq);
		return vo;
	}
	
	public UsersVO selectSellerInfo(int seq) {
		UsersVO mvo = new UsersVO();
		SqlSession conn =null;
		try { 
			conn = MyBatisFactory.getFactory().openSession();
			mvo = conn.selectOne("usersSpace.selectSellerInfo",seq);
		} finally {
			conn.close();
		}
		return mvo;
	}
	
	


	/*
	*//**
	 * 아이디 찾기
	 * @param uvo
	 * @return
	 *//*

	public UsersVO select(UsersVO userPhone) {  
		SqlSession conn =null;
		UsersVO vo = null;
		
		try {
			conn = MyBatisFactory.getFactory().openSession();
			vo = conn.selectOne("usersSpace.forgotid", userPhone);
		} finally {
			conn.close();
		}
		return vo;
	}
	*/
	

}