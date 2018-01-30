package com.bit.groupware.persistent.employee;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.employee.PhotoVO;

@Repository
public class PhotoDAOImpl implements PhotoDAO {
	private final static String NAMESPACE = "com.bit.groupware.persistent.mapper.PhotoMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	public void insertPhoto(PhotoVO photo) {
		sqlSession.insert(NAMESPACE + ".insertPhoto", photo);
	}

	public void deletePhoto(String photoNo) {
		sqlSession.delete(NAMESPACE + ".deletePhoto", photoNo);
	}

}
