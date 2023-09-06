package com.clearing.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.clearing.database.SqlSessionManager;

public class tbl_reviewWriteDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int insReviewData (tbl_reviewListDTO reviewDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int reviewWrite = sqlSession.insert("com.clearing.database.ReviewMapper.insReviewData",reviewDTO);
		sqlSession.close();
		return reviewWrite;
	
	}
}
