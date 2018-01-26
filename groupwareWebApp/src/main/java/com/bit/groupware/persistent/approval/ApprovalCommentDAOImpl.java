package com.bit.groupware.persistent.approval;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.approval.ApprovalCommentVO;

@Repository
public class ApprovalCommentDAOImpl implements ApprovalCommentDAO {
	private final String NAMESPACE="com.bit.groupware.persistent.mapper.approval.ApprovalCommentMapper.xml";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertApprovalComment(ApprovalCommentVO approvalComment) {
		sqlSession.insert(NAMESPACE+".insertApprovalComment",approvalComment);
	}

	public void updateApprovalComment(ApprovalCommentVO approvalComment) {
		sqlSession.update(NAMESPACE+".updateApprovalComment",approvalComment);
	}

	public void deleteApprovalComment(int commentNo) {
		sqlSession.delete(NAMESPACE+".deleteApprovalComment",commentNo);
	}


	
	
}
