package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.employee.MessageVO;
import com.bit.groupware.persistent.approval.MessageDAO;
@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDAO messageDAO;
	
	public void registerMessage(MessageVO message) {
		messageDAO.insertMessage(message); 
	}
	
	public void registerResonseMsg(MessageVO message) {
		
		messageDAO.insertMessage(message);
	}

	public void removeMessage(Map<String,Object> map) {
		messageDAO.deleteMessage(map); 
	}

	public MessageVO retrieveMessage(int msgNo) {
		
		// 쪽지 상세정보를 조회한다.
		MessageVO msg= messageDAO.selectMessage(msgNo);
		// 쪽지 읽음 상태 여부를 변경한다. 	
		messageDAO.updateMessageStatus(msgNo);
		return msg;
	}

	public List<MessageVO> retrieveMessageList(Map<String, Object> map) {
		return messageDAO.selectMessageList(map);
	}

	public int retrieveNewMessageCount(String empNo) {
		return messageDAO.selectNewMessageCount(empNo);
	}

	public int retrieveMessageCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return messageDAO.selectMessageCount(map); 
	}
	
	
	

}
