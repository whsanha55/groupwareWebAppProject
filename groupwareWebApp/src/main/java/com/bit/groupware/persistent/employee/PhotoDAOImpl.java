package com.bit.groupware.persistent.employee;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PhotoDAOImpl implements PhotoDAO {
	private final static String NAMESPACE = "com.bit.groupware.persistent.mapper.PhotoMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	public void insertPhoto(Map<String, Object> map) {
		sqlSession.insert(NAMESPACE + ".insertPhoto", map);
	}

	public void deletePhoto(String empNo) {
		sqlSession.delete(NAMESPACE + ".deletePhoto", empNo);
	}
	
	public void deleteSign(String empNo) {
		sqlSession.delete(NAMESPACE + ".deleteSign", empNo);
	}
	
}
