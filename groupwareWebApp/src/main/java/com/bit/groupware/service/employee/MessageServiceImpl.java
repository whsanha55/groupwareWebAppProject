package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.employee.MessageVO;
import com.bit.groupware.persistent.employee.MessageDAO;
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

	public void removeMessage(List<Integer> msgNos) {
		messageDAO.deleteMessage(msgNos); 
	}

	public MessageVO retrieveMessage(int msgNo) {
		
		// ���� �������� ��ȸ�Ѵ�.
		MessageVO msg= messageDAO.selectMessage(msgNo);
		// ���� ���� ���� ���θ� �����Ѵ�. 	
		messageDAO.updateMessageStatus(msgNo);
		return msg;
	}

	public List<MessageVO> retrieveMessageList(Map<String, Object> map) {
	
		return messageDAO.selectMessageList(map);
	}

}
