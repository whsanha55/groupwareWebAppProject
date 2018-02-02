package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.NotificationVO;

public interface NotificationService {

	List<NotificationVO> retrieveNotificationList(Map<String, Object> map);
	
	void removeNotification(Map<String, Integer> map);
	
	int retrieveNotificationCount(String empNo);
	
}
