package com.bit.groupware.service.approval;

import java.util.List;

import com.bit.groupware.domain.approval.ReceiverLineVO;

public interface ReceiverLineService {

	//������� �ܰ� ��ȸ
	List<ReceiverLineVO> retrieveReceiverLineList(int receiverNo);
	

	
}
