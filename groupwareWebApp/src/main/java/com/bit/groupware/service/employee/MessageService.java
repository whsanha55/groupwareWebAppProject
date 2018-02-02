package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.MessageVO;

public interface MessageService {
	
	void registerMessage(MessageVO message);
	
	void removeMessage(Map<String,Object> map);
	
	MessageVO retrieveMessage(int msgNo);
	
	List<MessageVO> retrieveMessageList(Map<String,Object> map);
}
