package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.domain.approval.ReceiverLineVO;

public interface ApprovalDAO {

	List<ApprovalVO> selectApprovalList(Map<String, Object> map);
	
	//����, �ݷ� �����Կ��� ��ȸ 
	List<ApprovalVO> selectAllApprovalList(Map<String, Object> map);

	ApprovalVO selectApproval(int apprNo);

	int insertApproval(ApprovalVO approval);

	void updateApproval(ApprovalVO approval);
	
	int selectApprovalCount(Map<String, Object> map);
	
	void deleteApproval(List<Integer> apprNos);
	
	ApprovalVO selectTempApproval(int apprNo);
	
	//����,�ݷ� �����Կ��� count
	int selectAllApprovalCount(Map<String,Object> map);
	
	//���� ������ ��ȸ
	List<ApprovalVO> selectExpectedApprList(Map<String, Object> map);
	
	//���� ������ count
	int selectExpectedApprCount(Map<String,Object> map);
}
