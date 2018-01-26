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
	void registerApproval(ApprovalVO approvalVO, int lineNo);

	//결재문서 회수
	void modifyApproval(int apprNo);
	
	//회수할 문서에 대한 최초 결재자의 결재 여부 확인
	Boolean isRecallable(int apprNo);
	
	
	
}
