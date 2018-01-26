package com.bit.groupware.service.approval;

import java.util.List;

import com.bit.groupware.domain.approval.ReceiverLineVO;

public interface ReceiverLineService {

	//결재라인 단계 조회
	
	public List<ReceiverLineVO> retrieveReceiverLineList(int receiverNo);
	
	//결재라인 목록 삽입 
	public void registerReceiverLineList(List<ReceiverLineVO> receiverLines);
	
	//결제라인 목록 삭제
	public void removeReceiverLines(int receiverNo);
	
}
