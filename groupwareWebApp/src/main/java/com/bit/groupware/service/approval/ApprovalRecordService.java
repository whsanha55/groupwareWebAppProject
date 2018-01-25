package com.bit.groupware.service.approval;

import java.util.List;

import com.bit.groupware.domain.approval.ApprovalRecordVO;

public interface ApprovalRecordService {

	//결재 진행 현황 조회
	List<ApprovalRecordVO> retrieveApprovalRecordList(int apprNo);
	
	//결재문서 승인.반려.보류
	void executeApprovalRecord(ApprovalRecordVO approvalRecordVO);
	
	
}
