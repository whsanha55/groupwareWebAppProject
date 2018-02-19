package com.bit.groupware.service.approval;

import java.util.List;

import com.bit.groupware.domain.approval.ReceiverVO;

public interface ReceiverService {

	//결재라인 추가
	void registerReceiver(ReceiverVO receiver);
	
	//결재선 조회
	List<ReceiverVO> retrieveReceiverList(String empNo);
	
	//결재선 이름 변경
	void modifyReceiver(ReceiverVO receiverVO);
	
	//결재선 삭제
	void removeReceiver(int receiverNo);
	
	
}
