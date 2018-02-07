package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.NotificationVO;
import com.bit.groupware.persistent.approval.NotificationDAO;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	private NotificationDAO dao;
	
	public List<NotificationVO> retrieveNotificationList(Map<String, Object> map) {
		
		return dao.selectNotificationList(map);
	}


	public void removeNotifications(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}


	public int retrieveNotificationCount(String empNo) {
		return dao.selectNotificationCount(empNo);
	}
	
	

}
