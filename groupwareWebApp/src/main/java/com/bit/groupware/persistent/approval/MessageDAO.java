package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.MessageVO;

public interface MessageDAO {

	void insertMessage(MessageVO message);
	
	void deleteMessage(Map<String,Object> map);
	
	MessageVO selectMessage(int msgNo);
	
	void updateMessageStatus(int msgNo); 
	
	List<MessageVO> selectMessageList(Map<String,Object> map);
	
	int selectNewMessageCount(String empNo);
	
	int selectMessageCount(Map<String,Object> map);
}
