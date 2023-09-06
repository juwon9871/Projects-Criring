package com.clearing.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.clearing.database.SqlSessionManager;

public class admin_reviewDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public int delete_review(int review_seq) {
		
		int delete = 0;
		
		delete = sqlSession.delete("com.clearing.database.adminMapper.delete_review", review_seq);
		
		sqlSession.close();
		
		return delete;
	}
	
	public List<admin_reviewDTO> selectAll_review() {
		
		List<admin_reviewDTO> selectAll_list = sqlSession.selectList("com.clearing.database.adminMapper.selectAll_review", new admin_reviewDTO());
		
		sqlSession.close();
		
		return selectAll_list;
	}
	
	public List<admin_reviewDTO> select_review(admin_reviewDTO dto) {
		
		List<admin_reviewDTO> select_list = sqlSession.selectList("com.clearing.database.adminMapper.select_review", dto);
		
		sqlSession.close();
		
		return select_list;
	}
	
}
