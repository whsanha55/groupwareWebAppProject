package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.ApprovalRecordVO;

public interface ApprovalRecordService {

	//결재 진행 현황 조회
	List<ApprovalRecordVO> retrieveApprovalRecordList(int apprNo);
	
	//결재문서 승인.반려.보류
	void executeApprovalRecord(Map<String, Object> map);
	
	//최초 결재자 결재여부 확인
	int retrieveApprovalRecallable(int apprNo);
	
	//메뉴 새 문서 개수 표시용
	int retrieveNewRecordCount(Map<String, String> map);
}
