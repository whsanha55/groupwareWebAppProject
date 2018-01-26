package com.bit.groupware.service.approval;

import java.util.List;

import com.bit.groupware.domain.approval.ReceiverLineVO;

public interface ReceiverLineService {

	//결재라인 단계 조회
	List<ReceiverLineVO> retrieveReceiverLineList(int receiverNo);
	

	
}
