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
	
	
	//���� ���� ��Ȳ ��ȸ
	public List<ApprovalRecordVO> retrieveApprovalRecordList(int apprNo) {		
		return approvalRecordDAO.selectApprovalRecordList(apprNo);
	}

	//�����̷� ����
	/*public void removeApprovalRecord(int apprNo) {
		approvalRecordDAO.deleteApprovalRecord(apprNo); 
	}*/  
	
	//���� ����, �ݷ�
	public void executeApprovalRecord(Map<String, Object> map) {

		//1. ���� ������Ʈ
		approvalRecordDAO.updateApprovalRecordStatus(map);
		
		int recordNo = (Integer) map.get("recordNo");
		int apprStatus = (Integer) map.get("apprStatus");
		if (apprStatus == 2) {	//������ �ڸ�Ʈ������ ���������ڶǴ� apprFinalStatus �ǵ帱�ʿ�����Ƿ� ����
			notificationDAO.insertNotificationProcess(map);
			return;
		}
		
		//2. �ڸ�Ʈ ������ ���
		String commentContent = (String) map.get("commentContent");
		if(!commentContent.equals("") && commentContent != null) {
			ApprovalCommentVO approvalComment = new ApprovalCommentVO();
			approvalComment.setApprovalRecord(new ApprovalRecordVO(recordNo));
			approvalComment.setCommentContent(commentContent);
			approvalCommentDAO.insertApprovalComment(approvalComment);
		}
		
		//3.���� ���������� �ƴ��� �ľ�
		if(apprStatus == 1 && approvalRecordDAO.checkisFinalApprovalLine(recordNo) ==0) {	//���������ڰ� �������
			approvalRecordDAO.insertApprovalRecordProceedProcedure(map);
			//notificationDAO.insertNotificationProcess(map);
		} else {	//������ ���� ����/�ݷ� ����
			ApprovalVO approval = new ApprovalVO();
			int apprNo = (Integer) map.get("apprNo");
			approval.setApprNo(apprNo);
			approval.setApprFinalStatus(apprStatus);
			approvalDAO.updateApproval(approval);
			notificationDAO.insertNotificationEnd(map);
			
		}
		
	}


	//���� ������ ���� ���� Ȯ��
	public int retrieveApprovalRecallable(int apprNo) {
		return approvalRecordDAO.selectApprovalRecallable(apprNo);
	}

	//�޴� �� ���� ���� ǥ�ÿ�
	public List<Integer> retrieveNewRecordCount(String empNo) {
		return approvalRecordDAO.selectNewRecordCount(empNo);
	}

	//Ȯ���Ͻ� �Է�
	public void modifyCheckDate(int recordNo) {
		approvalRecordDAO.updateCheckData(recordNo);		
	}


	public int retrieveRecNo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return approvalRecordDAO.selectRecNo(map); 
	}
	
	
	

	

}
