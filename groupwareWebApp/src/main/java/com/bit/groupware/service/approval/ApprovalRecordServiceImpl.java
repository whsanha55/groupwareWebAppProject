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
	
	
	
	
	//���� ���� ��Ȳ ��ȸ
	public List<ApprovalRecordVO> retrieveApprovalRecordList(int apprNo) {
		dao.selectApprovalRecordList(apprNo);
		return null;
	}

	
	public void executeApprovalRecord(ApprovalRecordVO approvalRecord) {
		ApprovalVO approval = approvalRecord.getApproval();
		
		//1. ���� ���� Ȯ��
		
		//2. ���� �������� ��� ��� ���� Ȯ��
		int lineOrder = approvalRecord.getReceiverLine().getLineOrder();		//������ �켱����	
		int last = approvalRecord.getApproval().getApprovalRecords().size();	//���� ������ ����
		//if(lineOrder == last) ~~~ ����� ����� �ֳ�~~~
		
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
		if(apprStatus == 2) {
			approval.setApprFinalStatus(2);
		} else if(apprStatus == 3) {
			approval.setApprFinalStatus(3);
		}
		
		approvalDAO.updateApproval(approval);
		
		
		//7. �˸�: Ʈ����
			
			
	}


	//���� ������ ���� ���� Ȯ��
	public int selectApprovalRecallable(int apprNo) {
		return dao.selectApprovalRecallable(apprNo);
	}
	
	
	

}
