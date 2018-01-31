package com.bit.groupware.persistent.authority;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class PostFileDAOImpl implements PostFileDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.authority.PostFileMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertPostFile(Map<String, Object> map) {
		sqlSession.insert(NAMESPACE+".insertPostFile", map);
		
	}

	public void removePostFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

}
