package com.reum.users;

import org.apache.ibatis.session.SqlSession;

import com.reum.common.MyBatisFactory;



public class UsersDAO {
	
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
			vo = conn.selectOne("usersSpace.login", uvo);
		} finally {
			conn.close();
		}
		return vo;
	}
	
	public UsersVO selectUserSeq(String sessionId, SqlSession PRMCONN) {
		UsersVO vo = PRMCONN.selectOne("usersSpace.selectUserSeq", sessionId);
		return vo;
	}
	
	public UsersVO selectSellerId(int seq, SqlSession PRMCONN) {
		UsersVO vo = PRMCONN.selectOne("usersSpace.selectSellerId", seq);
		return vo;
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