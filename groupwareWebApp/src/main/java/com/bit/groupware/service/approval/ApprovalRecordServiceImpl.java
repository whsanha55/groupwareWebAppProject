package com.bit.groupware.service.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.ApprovalRecordVO;
import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.persistent.approval.ApprovalCommentDAO;
import com.bit.groupware.persistent.approval.ApprovalDAO;
import com.bit.groupware.persistent.approval.ApprovalRecordDAO;
import com.bit.groupware.persistent.employee.DelegationDAO;

@Service
public class ApprovalRecordServiceImpl implements ApprovalRecordService {

	@Autowired
	private ApprovalRecordDAO dao;
	
	@Autowired
	private DelegationDAO delegationDAO;
	
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
		//1. ���� ���� Ȯ��
		
		//2. ���� �������� ��� ��� ���� Ȯ��
		
		//3. �����̷� ������� ����, ���� �Ͻ� ���
		dao.updateApprovalRecordStatus(approvalRecord);
		//4. ������ �ڸ�Ʈ ���
		commentDAO.insertApprovalComment(approvalRecord.getApprovalComment());
		
			//5. ���� �����ڰ� �ƴ� ��� ���� ������ �����̷� ���
		
			//6. ���� �������� ��� ���繮�� �������� ���� ����
			ApprovalVO approval = approvalRecord.getApproval();
			
			
		
		//7. ������ ���ÿ� �����ڿ��� �˸� �߽�: ������(���� ��û), �����(���� �Ϸ�/����/�ݷ�)
		
	}


	//���� ������ ���� ���� Ȯ��
	public int selectApprovalRecallable(int apprNo) {
		return dao.selectApprovalRecallable(apprNo);
	}
	
	
	

}
