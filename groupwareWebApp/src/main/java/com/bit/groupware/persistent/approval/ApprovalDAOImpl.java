package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.approval.ApprovalVO;

@Repository
public class ApprovalDAOImpl implements ApprovalDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.approval.ApprovalMapper";
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

	public void updateApproval(ApprovalVO approval) {
		sqlSession.update(NAMESPACE+".updateApproval", approval);
	}

	public int selectApprovalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".selectApprovalCount",map); 
	}

	public void deleteApproval(List<Integer> apprNos) {
		// TODO Auto-generated method stub
		sqlSession.delete(NAMESPACE+".deleteApproval",apprNos);
	}

	public ApprovalVO selectTempApproval(int apprNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".selectTempApproval", apprNo); 
	}

	public List<ApprovalVO> selectAllApprovalList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".selectAllApprovalList",map);
	}

	public int selectAllApprovalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".selectAllApprovalCount", map); 
	} 


	

}
