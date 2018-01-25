package com.bit.groupware.persistent.approval;

import java.util.List;

import com.bit.groupware.domain.approval.ReceiverLineVO;

public interface ReceiverLineDAO {

	List<ReceiverLineVO> selectReceiverLineList(int receiverNo);
	
	void insertReceiverLineList(List<ReceiverLineVO> receiverLines);
	
	void deleteReceiverLines(int receiverNo);
	
	
}
