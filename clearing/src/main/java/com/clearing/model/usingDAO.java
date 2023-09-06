package com.clearing.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.clearing.database.SqlSessionManager;

public class usingDAO {
	SqlSessionFactory sqlSessionFactory =SqlSessionManager.getSqlSession();
	
	public List<usingVO> usedLaundry(String timeZero){
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<usingVO> usedList = sqlSession.selectList("com.clearing.database.usingMapper.used",timeZero);
		if(usedList!=null) {
			sqlSession.commit();
		}else {
			sqlSession.rollback();
		}
		sqlSession.close();
		
		return usedList;
	}
	public List<usingVO> usedLaundry_byDate(String using_dt, String start_time){
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<usingVO> usedList  = sqlSession.selectList("com.clearing.database.usingMapper.used2",new usingVO(using_dt,start_time));
		if(usedList!=null) {
			sqlSession.commit();
		}else {
			sqlSession.rollback();
		}
		sqlSession.close();
		
		return usedList;
	}
	
	public int insertUsing(usingVO uVo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int insert = sqlSession.insert("com.clearing.database.usingMapper.insert", uVo);
		if(insert>0) {
			sqlSession.commit();;
		}else {
			sqlSession.rollback();
		}
		sqlSession.close();
		return insert;
	}
}
