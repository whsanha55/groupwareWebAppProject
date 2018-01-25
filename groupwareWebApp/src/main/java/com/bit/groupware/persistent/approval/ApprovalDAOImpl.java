package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.groupware.domain.approval.ApprovalVO;

public class ApprovalDAOImpl implements ApprovalDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.approval.ApprovalMapper.xml";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<ApprovalVO> selectApprovalList(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".selectApprovalList",map);
		
	}

	public ApprovalVO selectApproval(int apprNo) {
		return sqlSession.selectOne(NAMESPACE+".selectApproval",apprNo);
		
	}

	public int insertApproval(ApprovalVO approval) {
		 sqlSession.insert(NAMESPACE+".insertApproval",approval);
		 return approval.getApprNo();
	}

	public void updateApproval(int apprNo) {
		sqlSession.update(NAMESPACE+".updateApproval",apprNo);
	}

}
