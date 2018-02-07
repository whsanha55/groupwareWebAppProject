package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.NotificationVO;

public interface NotificationService {

	List<NotificationVO> retrieveNotificationList(Map<String, Object> map);
	
	int retrieveNotificationCount(String empNo);

	void removeNotifications(Map<String, Object> map);
	
}
