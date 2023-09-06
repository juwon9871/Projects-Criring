package com.clearing.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.clearing.database.SqlSessionManager;

public class admin_replyDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public int insert_reply (admin_replyDTO dto) {
		int insert = 0;
		
		insert = sqlSession.insert("com.clearing.database.adminMapper.insert_reply", dto);
		
		sqlSession.close();
		
		return insert;
	}
	
	public int update_reply (admin_replyDTO dto) {
		int update = 0;
		
		update = sqlSession.update("com.clearing.database.adminMapper.update_reply", dto);
		
		sqlSession.close();
		
		
		return update;
	}
	
	public int delete_reply (int reply_seq) {
		int delete = 0;
		
		delete = sqlSession.delete("com.clearing.database.adminMapper.delete_reply", reply_seq);
		
		sqlSession.close();
		
		return delete;
	}
	
	public admin_replyDTO select_reply (admin_replyDTO dto) {
		admin_replyDTO sDto = null;
		
		sDto = sqlSession.selectOne("com.clearing.database.adminMapper.select_reply", dto);
		
		sqlSession.close();
		
		return sDto;
	}
	
	public List<admin_replyDTO> selectAll_reply () {
		List<admin_replyDTO> select_list = null;
		
		select_list = sqlSession.selectList("com.clearing.database.adminMapper.selectAll_reply", new admin_replyDTO());
		
		sqlSession.close();
		
		return select_list;
	}
	
}
