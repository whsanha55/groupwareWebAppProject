package com.bit.groupware.service.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.ReceiverLineVO;
import com.bit.groupware.persistent.approval.ReceiverLineDAO;
import com.bit.groupware.persistent.approval.TemplateCategoryDAO;

@Service
public class ReceiverLineServiceImpl implements ReceiverLineService {

	@Autowired
	private ReceiverLineDAO receiverLine;

	public List<ReceiverLineVO> retrieveReceiverLineList(int receiverNo) {

		return receiverLine.selectReceiverLineList(receiverNo);
	}

	public void removeReceiverLines(int receiverNo) {
		receiverLine.deleteReceiverLines(receiverNo);
	}

	public List<ReceiverLineVO> retrieveApprovalLineList(int apprNo) {
		// TODO Auto-generated method stub
		return receiverLine.selectApprovalLineList(apprNo); 
	}

	public List<ReceiverLineVO> retrieveReceiverLineByApprNo(int apprNo) {
		// TODO Auto-generated method stub
		return receiverLine.selectReceiverLineByApprNo(apprNo);
	}
	
	

}
