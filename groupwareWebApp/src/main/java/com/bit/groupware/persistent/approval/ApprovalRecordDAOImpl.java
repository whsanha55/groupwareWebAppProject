package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.approval.ApprovalRecordVO;

@Repository
public class ApprovalRecordDAOImpl implements ApprovalRecordDAO {

	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.approval.ApprovalRecordMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<ApprovalRecordVO> selectApprovalRecordList(int apprNo) {
		return sqlSession.selectList(NAMESPACE + ".selectApprovlaRecordList", apprNo);
	}

	public void insertApprovalRecord(Map<String, Integer> map) {
		sqlSession.insert(NAMESPACE + ".insertApprovalRecord", map);
	}

	public void insertApprovalRecordProcedure(Map<String, Integer> map) {
		sqlSession.insert(NAMESPACE + ".insertApprovalRecordProcedure", map);
	}

	public void updateApprovalRecordStatus(ApprovalRecordVO approvalRecord) {
		sqlSession.update(NAMESPACE + ".updateApprovalRecordStatus", approvalRecord);
	}

	public void deleteApprovalRecord(int apprNo) {
		sqlSession.delete(NAMESPACE + ".deleteApprovalRecord", apprNo);
	}

	public int selectApprovalRecallable(int apprNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectApprovalRecallable", apprNo);
	}

}
