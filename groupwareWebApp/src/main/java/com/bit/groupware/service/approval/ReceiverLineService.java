package com.bit.groupware.service.approval;

import java.util.List;

import com.bit.groupware.domain.approval.ReceiverLineVO;

public interface ReceiverLineService {

	//결재라인 단계 조회
	
	public List<ReceiverLineVO> retrieveReceiverLineList(int receiverNo);
	
	//상세조회에서 쓰는 라인 조회
	public List<ReceiverLineVO> retrieveApprovalLineList(int apprNo);

	//결제라인 목록 삭제
	public void removeReceiverLines(int receiverNo);
	
	public List<ReceiverLineVO> retrieveReceiverLineByApprNo(int apprNo);
}
