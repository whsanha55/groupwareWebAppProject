package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.domain.approval.ReceiverLineVO;

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
	
	//승인,반려 문서함에서 count
	int selectAllApprovalCount(Map<String,Object> map);
	
	//결재 예정함 조회
	List<ApprovalVO> selectExpectedApprList(Map<String, Object> map);
	
	//결재 예정함 count
	int selectExpectedApprCount(Map<String,Object> map);
}
