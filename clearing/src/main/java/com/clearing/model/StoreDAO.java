package com.clearing.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.clearing.database.SqlSessionManager;

public class StoreDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	public int insertLaundry(LaundryDTO ldto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int result = 0;
		result = sqlSession.insert("registLaundry", ldto);
		sqlSession.close();
		return result;
	}

	public StoreDTO loginChk(StoreDTO sdto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		StoreDTO storeMember = null;
		storeMember = sqlSession.selectOne("storeLoginChk", sdto);

		return storeMember;
	}
	public StoreVO storeData(StoreVO sVo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		StoreVO storeData = sqlSession.selectOne("com.clearing.database.bookLaundryMapper.selStoreData",sVo);
		sqlSession.close();
		return storeData;
	}
	public StoreVO storelocation(String store_name) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		StoreVO storelocation = sqlSession.selectOne("com.clearing.database.MemberMapper.selLocation",store_name);
		sqlSession.close();
		return storelocation;
	}
	
	public List<StoreVO> storeN() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<StoreVO> storeN = sqlSession.selectList("com.clearing.database.ReviewMapper.selNoReview");
		sqlSession.close();
		
		return storeN;
	}
	
	public List<StoreVO> storeReviewNum(){
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<StoreVO> storeReviewNum = sqlSession.selectList("com.clearing.database.ReviewMapper.selReviewNum");
		sqlSession.close();
		
		return storeReviewNum;
	}
	
	public List<StoreVO> selAll(){
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<StoreVO> selAll = sqlSession.selectList("com.clearing.database.ReviewMapper.selAll");
		sqlSession.close();
		
		return selAll;
		
		
	}
}
