package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.bit.groupware.domain.approval.ApprovalVO;

public interface ApprovalService {

	//���繮�� ��ȸ(���� ����)
	List<ApprovalVO> retrieveApprovalList(Map<String, Object> map);

	//���繮�� ��ȸ (���� ����)
	List<ApprovalVO> retrieveAllApprovalList(Map<String, Object> map);
	
	//���繮�� ����ȸ
	ApprovalVO retrieveApproval(int apprNo);
	
	//��ȹ��� ���
	void registerApproval(ApprovalVO approval, int receiverNo);

	//���繮�� ȸ��/����/����/�ݷ�
	void modifyApproval(ApprovalVO approval);
	
	//���� ���ϱ�
	int retrieveApprovalCount(Map<String, Object> map);
	
	//����
	void removeApproval(List<Integer> apprNos);
	
	//�ӽú����Կ��� ���� �� �� ��ȸ
	ApprovalVO retrieveTempApproval(int apprNO);
}
