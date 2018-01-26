package com.bit.groupware.service.approval;

import java.util.List;

import com.bit.groupware.domain.approval.ReceiverLineVO;

public interface ReceiverLineService {

	//������� �ܰ� ��ȸ
	
	public List<ReceiverLineVO> retrieveReceiverLineList(int receiverNo);
	
	//������� ��� ���� 
	public void registerReceiverLineList(List<ReceiverLineVO> receiverLines);
	
	//�������� ��� ����
	public void removeReceiverLines(int receiverNo);
	
}
