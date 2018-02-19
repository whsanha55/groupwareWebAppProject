package com.bit.groupware.service.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.ReceiverLineVO;
import com.bit.groupware.domain.approval.ReceiverVO;
import com.bit.groupware.persistent.approval.ReceiverDAO;
import com.bit.groupware.persistent.approval.ReceiverLineDAO;
import com.bit.groupware.persistent.approval.TemplateCategoryDAO;
@Service
public class ReceiverServiceImpl implements ReceiverService{
	@Autowired
	private ReceiverDAO receiverDAO;
	
	@Autowired
	private ReceiverLineDAO receiverLineDAO;

	public int registerReceiver(ReceiverVO receiver) {
		
		int receiverNo = receiverDAO.insertReceiver(receiver);
		receiver.setReceiverNo(receiverNo);
		
		List<ReceiverLineVO> receiverLines = receiver.getReceiverLines();
		for(ReceiverLineVO receiverLine : receiverLines) {
			receiverLine.setReceiver(receiver);
		}
		
		receiverLineDAO.insertReceiverLineList(receiverLines);
		return receiverNo;
	}

	public List<ReceiverVO> retrieveReceiverList(String empNo) {
		return receiverDAO.selectReceiverList(empNo);
	}

	public void modifyReceiver(ReceiverVO receiverVO) {
		receiverDAO.updateReceiver(receiverVO);
		
	}

	public void removeReceiver(int receiverNo) {
		receiverDAO.deleteReceiver(receiverNo);
		
	}
	
	
	
	
}
