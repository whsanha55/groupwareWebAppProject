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

	public void insertApprovalRecord(Map<String, Object> map) {
		sqlSession.insert(NAMESPACE + ".insertApprovalRecord", map);
	}

	public void insertApprovalRecordProcedure(Map<String, Integer> map) {
		sqlSession.insert(NAMESPACE + ".insertApprovalRecordProcedure", map);
	}
	
	
	public void insertApprovalRecordProceedProcedure(Map<String, Object> map) {
		sqlSession.insert(NAMESPACE + ".insertApprovalRecordProceedProcedure", map);
	}

	public void updateApprovalRecordStatus(Map<String, Object> map) {
		sqlSession.update(NAMESPACE + ".updateApprovalRecordStatus", map);
	}

	

	public void deleteApprovalRecord(List<Integer> apprNos) {
		sqlSession.delete(NAMESPACE + ".deleteApprovalRecord", apprNos);
		
	}

	public int selectApprovalRecallable(int apprNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectApprovalRecallable", apprNo);
	}

	public List<Integer> selectNewRecordCount(String empNo) {
		return sqlSession.selectList(NAMESPACE + ".selectNewRecordCount", empNo);
	}

	//최종 결재자인지 아닌지 확인하는 dao (0->다음 진행자 있음, 1->종결)
	public int checkisFinalApprovalLine(int recordNo) {
		return sqlSession.selectOne(NAMESPACE + ".checkisFinalApprovalLine", recordNo) ;
	}

	public void updateCheckData(int recordNo) {
		sqlSession.selectOne(NAMESPACE + ".updateCheckDate", recordNo);		
	}

	public int selectRecNo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".selectRecNo",map); 
	}
	
	

	
}
