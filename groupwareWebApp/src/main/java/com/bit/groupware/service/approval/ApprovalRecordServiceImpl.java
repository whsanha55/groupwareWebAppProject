package com.bit.groupware.service.approval;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.ApprovalRecordVO;
import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.persistent.approval.ApprovalCommentDAO;
import com.bit.groupware.persistent.approval.ApprovalDAO;
import com.bit.groupware.persistent.approval.ApprovalRecordDAO;
import com.bit.groupware.persistent.employee.DelegationDAO;
import com.bit.groupware.persistent.employee.NotificationDAO;

@Service
public class ApprovalRecordServiceImpl implements ApprovalRecordService {

	@Autowired
	private ApprovalRecordDAO dao;
	
	@Autowired
	private ApprovalCommentDAO commentDAO;
	
	@Autowired
	private ApprovalDAO approvalDAO;
	
	
	
	
	//결재 진행 현황 조회
	public List<ApprovalRecordVO> retrieveApprovalRecordList(int apprNo) {
		dao.selectApprovalRecordList(apprNo);
		return null;
	}

	
	public void executeApprovalRecord(ApprovalRecordVO approvalRecord) {
		ApprovalVO approval = approvalRecord.getApproval();
		
		//1. 전결 여부 확인
		
		//2. 최종 결재자인 경우 대결 여부 확인
		int lineOrder = approvalRecord.getReceiverLine().getLineOrder();		//결재자 우선순위	
		int last = approvalRecord.getApproval().getApprovalRecords().size();	//최종 결재자 순위
		//if(lineOrder == last) ~~~ 사장님 대결자 있나~~~
		
		//3. 결재이력 진행상태 변경, 결재 일시 기록-> 컨트롤러에서 .set해서 보냄?
		dao.updateApprovalRecordStatus(approvalRecord);
		
		//4. 결재자 코멘트 등록
		commentDAO.insertApprovalComment(approvalRecord.getApprovalComment());
		
		//5. 최종 결재자가 아닐 경우 다음 결재자 결재이력 등록
		//추가할 새 결재이력 세팅은 어떻게? 트리거였나?
//		dao.insertApprovalRecord(approvalRecord);	
				
		//6. 최종 결재자일 경우 결재문서 최종상태 여부 변경
		approval.setApprFinalStatus(1);
		//진행상태 보류, 반려면 최종 상태도 변경
		int apprStatus = approvalRecord.getApprStatus();
		if(apprStatus == 2) {
			approval.setApprFinalStatus(2);
		} else if(apprStatus == 3) {
			approval.setApprFinalStatus(3);
		}
		
		approvalDAO.updateApproval(approval);
		
		
		//7. 알림: 트리거
			
			
	}


	//최초 결재자 결재 여부 확인
	public int selectApprovalRecallable(int apprNo) {
		return dao.selectApprovalRecallable(apprNo);
	}
	
	
	

}
