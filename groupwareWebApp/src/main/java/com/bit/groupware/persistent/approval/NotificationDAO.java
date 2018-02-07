package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.NotificationVO;

public interface NotificationDAO {

	List<NotificationVO> selectNotificationList(Map<String, Object> map);

	void deleteNotification(Map<String, Object> map);
	
	int selectNotificationCount(String empNo);
	
	//�˸����� DB�� �ݿ�
	void insertNotification(Map<String,Object> map);
	
}
