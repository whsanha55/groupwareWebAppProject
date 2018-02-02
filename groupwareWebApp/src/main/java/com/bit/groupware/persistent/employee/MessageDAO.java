package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.MessageVO;

public interface MessageDAO {

	void insertMessage(MessageVO message);
	
	void deleteMessage(Map<String,Object> map);
	
	MessageVO selectMessage(int msgNo);
	
	void updateMessageStatus(int msgNo); 
	
	List<MessageVO> selectMessageList(Map<String,Object> map);
}
