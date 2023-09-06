package com.clearing.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.clearing.database.SqlSessionManager;

public class MemberDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public int joinMember(MemberDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int result = sqlSession.insert("joinMember", dto);
		sqlSession.close();
		return result;
	}
	
	public int joinStore(StoreDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int result = sqlSession.insert("joinStore", dto);
		sqlSession.close();
		return result;
	}
	
	public MemberDTO loginChk(MemberDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		MemberDTO member = null;
		member = sqlSession.selectOne("loginChk", dto);
		sqlSession.close();
		return member;
	}
	
	public int loginCount(MemberDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int result = sqlSession.selectOne("loginCount", dto);
		
		sqlSession.close();
		return result;
	}
	
	public int updateMember(MemberDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int result = sqlSession.update("com.clearing.database.MemberMapper.updateMember", dto);
		sqlSession.close();
		
		return result;
	}
	
	public int idDchk(String MB_EMAIL) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int result =sqlSession.selectOne("com.clearing.database.MemberMapper.Dchk",MB_EMAIL);
		sqlSession.close();
		return result;
	}
}
