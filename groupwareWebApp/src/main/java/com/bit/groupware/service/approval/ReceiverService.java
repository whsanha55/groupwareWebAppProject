package com.bit.groupware.service.approval;

import java.util.List;

import com.bit.groupware.domain.approval.ReceiverVO;

public interface ReceiverService {

	//������� �߰�
	int registerReceiver(ReceiverVO receiver);
	
	//���缱 ��ȸ
	List<ReceiverVO> retrieveReceiverList();
	
	//���缱 �̸� ����
	void modifyReceiver(ReceiverVO receiverVO);
	
	//���缱 ����
	void removeReceiver(int receiverNo);
	
}
