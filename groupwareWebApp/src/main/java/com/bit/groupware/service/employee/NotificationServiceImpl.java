package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.employee.NotificationVO;
import com.bit.groupware.persistent.employee.NotificationDAO;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	private NotificationDAO dao;
	
	public List<NotificationVO> retrieveNotificationList(Map<String, Object> map) {
		return dao.selectNotificationList(map);
	}

	public void removeNotification(Map<String, Integer> map) {
		dao.deleteNotification(map);
		
	}

	public int retrieveNotificationCount(String empNo) {
		return dao.selectNotificationCount(empNo);
	}
	
	

}
