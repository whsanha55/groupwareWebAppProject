package com.bit.groupware.persistent.approval;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ApprovalAutomaticDAOImpl implements ApprovalAutomaticDAO{
	private final String NAMESPACE="com.bit.groupware.persistent.mapper.approval.ApprovalAutomaticUpdate";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//발표용
	public void automaticallyRemoveDAO() {
		
		sqlSession.delete(NAMESPACE+".deleteMessageAutomatically");
		
	}
	
	//실제구현

	public void automaticallyRemoveDAO2() {
		
		sqlSession.delete(NAMESPACE+".deleteMessageAutomatically2");
		
	}

	
}
