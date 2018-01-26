package com.bit.groupware.service.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.ReceiverLineVO;
import com.bit.groupware.persistent.approval.ReceiverLineDAO;
import com.bit.groupware.persistent.approval.TemplateCategoryDAO;
@Service
public class ReceiverLineServiceImpl implements ReceiverLineService{
	
	@Autowired
	private ReceiverLineDAO receiverLine;

	public List<ReceiverLineVO> retrieveReceiverLineList(int receiverNo) {
		
		return receiverLine.selectReceiverLineList(receiverNo);
	}

	public void registerReceiverLineList(List<ReceiverLineVO> receiverLines) {
		
		receiverLine.insertReceiverLineList(receiverLines);		
	}

	public void removeReceiverLines(int receiverNo) {
		receiverLine.deleteReceiverLines(receiverNo);		
	}
	
		
}
