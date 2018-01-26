package com.bit.groupware.service.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.ApprovalRecordVO;
import com.bit.groupware.persistent.approval.ApprovalRecordDAO;

@Service
public class ApprovalRecordServiceImpl implements ApprovalRecordService {

	@Autowired
	private ApprovalRecordDAO dao;
	
	//결재 진행 현황 조회
	public List<ApprovalRecordVO> retrieveApprovalRecordList(int apprNo) {
		dao.selectApprovalRecordList(apprNo);
		return null;
	}

	
	public void executeApprovalRecord(ApprovalRecordVO approvalRecordVO) {
		//1. 전결 여부 확인
		
		//2. 최종 결재자인 경우 대결 여부 확인
		
		//3. 결재이력 진행상태 변경, 결재 일시 기록
		
		//4. 결재자 코멘트 등록
		
			//5. 최종 결재자가 아닐 경우 다음 결재자 결재이력 등록
		
			//6. 최종 결재자일 경우 결재문서 최종상태 여부 변경
	
		//7. 배정과 동시에 결재자에게 알림 발신: 참조자(결재 요청), 기안자(결재 완료/보류/반려)
		
	}
	

}
