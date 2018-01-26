package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.ApprovalVO;

public interface ApprovalService {

	//���繮�� ��ȸ
	List<ApprovalVO> retrieveApprovalList(Map<String, Object> map);
	
	//���繮�� ����ȸ
	ApprovalVO retrieveApproval(int apprNo);
	
	//��ȹ��� ���
	void registerApproval(ApprovalVO approval);

	//���繮�� ȸ��
	void modifyApproval(ApprovalVO approval);
	

	
	
}
