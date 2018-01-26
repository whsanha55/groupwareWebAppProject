package com.bit.groupware.service.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.ReceiverVO;
import com.bit.groupware.persistent.approval.ReceiverDAO;
import com.bit.groupware.persistent.approval.TemplateCategoryDAO;
@Service
public class ReceiverServiceImpl implements ReceiverService{
	@Autowired
	private ReceiverDAO receiverDAO;

	public int registerReceiver(ReceiverVO receiver) {
		
		return receiverDAO.insertReceiver(receiver);
	}

	public List<ReceiverVO> retrieveReceiverList() {
		return receiverDAO.selectReceiverList();
	}

	public void modifyReceiver(ReceiverVO receiverVO) {
		receiverDAO.updateReceiver(receiverVO);
		
	}

	public void removeReceiver(int receiverNo) {
		receiverDAO.deleteReceiver(receiverNo);
		
	}
	
	
	
	
}
