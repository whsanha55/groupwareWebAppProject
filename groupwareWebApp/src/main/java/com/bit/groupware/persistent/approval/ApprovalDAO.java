package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.ApprovalVO;

public interface ApprovalDAO {

	List<ApprovalVO> selectApprovalList(Map<String, Object> map);
	
	//승인, 반려 문서함에서 조회 
	List<ApprovalVO> selectAllApprovalList(Map<String, Object> map);

	ApprovalVO selectApproval(int apprNo);

	int insertApproval(ApprovalVO approval);

	void updateApproval(ApprovalVO approval);
	
	int selectApprovalCount(Map<String, Object> map);
	
	void deleteApproval(List<Integer> apprNos);
	
	ApprovalVO selectTempApproval(int apprNo);
	
	
}
