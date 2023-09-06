package com.clearing.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.clearing.database.SqlSessionManager;

public class tbl_reviewListDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<tbl_reviewListDTO> selReviewData (String store_Email){
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		List<tbl_reviewListDTO> reviewList = sqlsession.selectList("com.clearing.database.ReviewMapper.selReviewData", store_Email);
		sqlsession.close();
		return reviewList; 
	}
	
	public List<tbl_reviewListDTO> userReviewData (String user_email){
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		List<tbl_reviewListDTO> userReviewList = sqlsession.selectList("com.clearing.database.ReviewMapper.userReviewData", user_email);
		sqlsession.close();
		
		return userReviewList;
	}
	
	public List<StoreDTO> selReviewStoreName (String store_email){
		SqlSession sqlsession = sqlSessionFactory.openSession(true);
		List<StoreDTO> selReviewStoreName = sqlsession.selectList("com.clearing.database.ReviewMapper.selReviewStoreName", store_email);
		sqlsession.close();	
		
		return selReviewStoreName;
	}
	public int delReviewData (Double review_SEQ) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int reviewDelete = sqlSession.delete("com.clearing.database.ReviewMapper.delReviewData", review_SEQ);
		sqlSession.close();
		
		return reviewDelete;
	}
	
	
}
