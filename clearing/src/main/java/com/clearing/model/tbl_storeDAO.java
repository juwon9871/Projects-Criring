package com.clearing.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.clearing.database.SqlSessionManager;

public class tbl_storeDAO {
SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

public StoreDTO selStoreData(StoreDTO storeDTO) {
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	StoreDTO selstore = sqlSession.selectOne("com.clearing.database.ReviewMapper.selStoreData",storeDTO);
	sqlSession.close();
	
	return selstore;
	}
}
