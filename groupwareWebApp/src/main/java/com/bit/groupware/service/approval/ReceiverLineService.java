package com.bit.groupware.service.approval;

import java.util.List;

import com.bit.groupware.domain.approval.ReceiverLineVO;

public interface ReceiverLineService {

	//������� �ܰ� ��ȸ
	
	public List<ReceiverLineVO> retrieveReceiverLineList(int receiverNo);
	
	//����ȸ���� ���� ���� ��ȸ
	public List<ReceiverLineVO> retrieveApprovalLineList(int apprNo);

	//�������� ��� ����
	public void removeReceiverLines(int receiverNo);
	
	public List<ReceiverLineVO> retrieveReceiverLineByApprNo(int apprNo);
}
