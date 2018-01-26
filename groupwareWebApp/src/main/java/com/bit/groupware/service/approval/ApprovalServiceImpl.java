package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.persistent.approval.ApprovalDAO;
import com.bit.groupware.persistent.approval.ApprovalRecordDAO;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private ApprovalDAO dao;
	
	@Autowired
	private ApprovalRecordDAO recordDAO;
	
	
	//���繮�� ��ȸ
	public List<ApprovalVO> retrieveApprovalList(Map<String, Object> map) {
		return dao.selectApprovalList(map);
	}

	//���繮�� ����ȸ
	public ApprovalVO retrieveApproval(int apprNo) {
		return dao.selectApproval(apprNo);
	}

	//���繮�� ���
	public void registerApproval(ApprovalVO approvalVO, int lineNo) {
		//1. ���繮�� ���
		
		//2. ���� ÷������ ���
		
		//3. ���� �̷� ���
		
		//4. �˸� ���
		
		
	}

	//���� ���� ȸ��
	public void modifyApproval(ApprovalVO approval) {
/*		//1. ���� �������� ���� ���� Ȯ��
		boolean isRecallable = recordDAO.selectApprovalRecallable(apprNo);
		
		if(!isRecallable) {
			//2. ���� �̷� ����
			recordDAO.deleteApprovalRecord(apprNo);
			
			//3. ���繮�� �������� ���� ���� = ȸ��
			dao.updateApproval(approval);
		} */
		
	}


	
	
}
