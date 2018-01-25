package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.NotificationVO;

public interface NotificationDAO {

	List<NotificationVO> selectNotificationList(Map<String, Object> map);

	void deleteNotification(Map<String, Integer> map);
}
