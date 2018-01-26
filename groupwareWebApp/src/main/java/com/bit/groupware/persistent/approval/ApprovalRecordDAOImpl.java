package com.bit.groupware.persistent.approval;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.groupware.domain.approval.ApprovalRecordVO;

public class ApprovalRecordDAOImpl implements ApprovalRecordDAO {
	
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.approval.ApprovalRecordMapper.xml";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<ApprovalRecordVO> selectApprovalRecordList(int apprNo) {
		return sqlSession.selectList(NAMESPACE+".selectApprovlaRecordList",apprNo);
	}

	public void insertApprovalRecord(ApprovalRecordVO approvalRecord) {
		sqlSession.insert(NAMESPACE+".insertApprovalRecord",approvalRecord);
	}

	public void updateApprovalRecordStatus(ApprovalRecordVO approvalRecord) {
		sqlSession.update(NAMESPACE+".updateApprovalRecordStatus",approvalRecord);

	}

	public void deleteApprovalRecord(int apprNo) {
		sqlSession.delete(NAMESPACE+".deleteApprovalRecord",apprNo);

	}

}
