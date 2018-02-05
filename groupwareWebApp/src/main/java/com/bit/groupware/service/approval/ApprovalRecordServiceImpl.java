package com.bit.groupware.service.approval;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
	
	
	
	
	//���� ���� ��Ȳ ��ȸ
	public List<ApprovalRecordVO> retrieveApprovalRecordList(int apprNo) {
		
		return dao.selectApprovalRecordList(apprNo);
	}


	//���� ����, �ݷ�
	public void executeApprovalRecord(ApprovalRecordVO approvalRecord) {
		ApprovalVO approval = approvalRecord.getApproval();
		List<ApprovalRecordVO> approvalRecords = approval.getApprovalRecords();
		//1. ���� ���� Ȯ��
		
		//2. ���� �������� ��� ��� ���� Ȯ��
		//int lineOrder = approvalRecord.getReceiverLine().getLineOrder();		//������ �켱����	
		//int last = approvalRecord.getApproval().getApprovalRecords().size();	//���� ������ ����
		//if(lineOrder == 9) ~~~ ����� ����� �ֳ�~~~
		
		//�̻���� �켱���� 9������ �ƴ��� Ȯ���ϴ� ���۰� �ʿ��մϴ�
		//if(9���̸� ���� �ƴϸ� ������� ����)
		if(approvalRecords.get(approvalRecords.size()-1).getApprStatus() == 9) {	//����
			
		}	
		
		//3. �����̷� ������� ����, ���� �Ͻ� ���-> ��Ʈ�ѷ����� .set�ؼ� ����?
		dao.updateApprovalRecordStatus(approvalRecord);
		
		//4. ������ �ڸ�Ʈ ���
		commentDAO.insertApprovalComment(approvalRecord.getApprovalComment());
		
		//5. ���� �����ڰ� �ƴ� ��� ���� ������ �����̷� ���
		//�߰��� �� �����̷� ������ ���? Ʈ���ſ���?
//		dao.insertApprovalRecord(approvalRecord);	
				
		//6. ���� �������� ��� ���繮�� �������� ���� ����
		approval.setApprFinalStatus(1);
		//������� ����, �ݷ��� ���� ���µ� ����
		int apprStatus = approvalRecord.getApprStatus();
		if(apprStatus == 3) {
			approval.setApprFinalStatus(3);
		}
		
		approvalDAO.updateApproval(approval);
		
		
		//7. �˸�: Ʈ����
			
			
	}


	//���� ������ ���� ���� Ȯ��
	public int retrieveApprovalRecallable(int apprNo) {
		return dao.selectApprovalRecallable(apprNo);
	}

	//�޴� �� ���� ���� ǥ�ÿ�
	public int retrieveNewRecordCount(Map<String, String> map) {
		return dao.selectNewRecordCount(map);
	}
	
	
	

}
