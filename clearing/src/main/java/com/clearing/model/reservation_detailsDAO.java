package com.clearing.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.clearing.database.SqlSessionManager;

public class reservation_detailsDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public List<usingVO> show_reservation(usingVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<usingVO> details = null;
		details = sqlSession.selectList("com.clearing.database.reservationMapper.selectdetailList",vo);
		
		sqlSession.close();
		return details;
	}
	
	public int deleteReservation(usingVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int result = sqlSession.delete("com.clearing.database.reservationMapper.deleteReservation", vo);
		
		sqlSession.close();
		return result;
	}
}
