package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.ApprovalCommentVO;
import com.bit.groupware.domain.approval.ApprovalRecordVO;
import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.persistent.approval.ApprovalCommentDAO;
import com.bit.groupware.persistent.approval.ApprovalDAO;
import com.bit.groupware.persistent.approval.ApprovalRecordDAO;
import com.bit.groupware.persistent.approval.NotificationDAO;

@Service
public class ApprovalRecordServiceImpl implements ApprovalRecordService {

	@Autowired
	private ApprovalRecordDAO approvalRecordDAO;
	
	@Autowired
	private ApprovalCommentDAO approvalCommentDAO;
	
	@Autowired
	private ApprovalDAO approvalDAO;
	
	@Autowired
	private NotificationDAO notificationDAO;
	
	
	//결재 진행 현황 조회
	public List<ApprovalRecordVO> retrieveApprovalRecordList(int apprNo) {		
		return approvalRecordDAO.selectApprovalRecordList(apprNo);
	}

	//결재이력 삭제
	/*public void removeApprovalRecord(int apprNo) {
		approvalRecordDAO.deleteApprovalRecord(apprNo); 
	}*/  
	
	//결재 승인, 반려
	public void executeApprovalRecord(Map<String, Object> map) {

		//1. 결재 업데이트
		approvalRecordDAO.updateApprovalRecordStatus(map);
		
		int recordNo = (Integer) map.get("recordNo");
		int apprStatus = (Integer) map.get("apprStatus");
		if (apprStatus == 2) {	//보류는 코멘트도없고 다음결재자또는 apprFinalStatus 건드릴필요없으므로 리턴
			notificationDAO.insertNotificationProcess(map);
			return;
		}
		
		//2. 코멘트 있으면 등록
		String commentContent = (String) map.get("commentContent");
		if(!commentContent.equals("") && commentContent != null) {
			ApprovalCommentVO approvalComment = new ApprovalCommentVO();
			approvalComment.setApprovalRecord(new ApprovalRecordVO(recordNo));
			approvalComment.setCommentContent(commentContent);
			approvalCommentDAO.insertApprovalComment(approvalComment);
		}
		
		//3.최종 결재자인지 아닌지 파악
		if(apprStatus == 1 && approvalRecordDAO.checkisFinalApprovalLine(recordNo) ==0) {	//다음결재자가 있을경우
			approvalRecordDAO.insertApprovalRecordProceedProcedure(map);
			//notificationDAO.insertNotificationProcess(map);
		} else {	//문서가 최종 승인/반려 종료
			ApprovalVO approval = new ApprovalVO();
			int apprNo = (Integer) map.get("apprNo");
			approval.setApprNo(apprNo);
			approval.setApprFinalStatus(apprStatus);
			approvalDAO.updateApproval(approval);
			notificationDAO.insertNotificationEnd(map);
			
		}
		
	}


	//최초 결재자 결재 여부 확인
	public int retrieveApprovalRecallable(int apprNo) {
		return approvalRecordDAO.selectApprovalRecallable(apprNo);
	}

	//메뉴 새 문서 개수 표시용
	public List<Integer> retrieveNewRecordCount(String empNo) {
		return approvalRecordDAO.selectNewRecordCount(empNo);
	}

	//확인일시 입력
	public void modifyCheckDate(int recordNo) {
		approvalRecordDAO.updateCheckData(recordNo);		
	}


	public int retrieveRecNo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return approvalRecordDAO.selectRecNo(map); 
	}
	
	
	

	

}
