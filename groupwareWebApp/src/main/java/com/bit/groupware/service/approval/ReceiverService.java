package com.bit.groupware.service.approval;

import java.util.List;

import com.bit.groupware.domain.approval.ReceiverVO;

public interface ReceiverService {

	//������� �߰�
	void registerReceiver(ReceiverVO receiver);
	
	//���缱 ��ȸ
	List<ReceiverVO> retrieveReceiverList(String empNo);
	
	//���缱 �̸� ����
	void modifyReceiver(ReceiverVO receiverVO);
	
	//���缱 ����
	void removeReceiver(int receiverNo);
	
	
}
