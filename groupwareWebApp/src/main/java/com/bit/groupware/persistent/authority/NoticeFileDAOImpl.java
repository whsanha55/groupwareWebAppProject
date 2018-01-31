package com.bit.groupware.persistent.authority;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class NoticeFileDAOImpl implements NoticeFileDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.authority.NoticeFileMapper";	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertNoticeFile(Map<String, Object> map) {
		sqlSession.insert(NAMESPACE + ".insertNoticeFile", map);		
		
	}

	public void removeNoticeFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

}
