package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.ApprovalVO;

public interface ApprovalService {

	//결재문서 조회
	List<ApprovalVO> retrieveApprovalList(Map<String, Object> map);
	
	//결재문서 상세조회
	ApprovalVO retrieveApproval(int apprNo);
	
	//기안문서 상신
	void registerApproval(ApprovalVO approval);

	//결재문서 회수
	void modifyApproval(ApprovalVO approval);
	

	
	
}
