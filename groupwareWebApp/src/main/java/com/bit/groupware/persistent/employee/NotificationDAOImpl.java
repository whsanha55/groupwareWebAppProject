package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.employee.NotificationVO;

@Repository
public class NotificationDAOImpl implements NotificationDAO {
	
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.employee.NotificationMapper";

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<NotificationVO> selectNotificationList(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectNotificationList", map);
	}

	public void deleteNotification(Map<String, Integer> map) {
		sqlSession.delete(NAMESPACE + ".deleteNotification", map);
		
	}

	public int selectNotificationCount(String empNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectNotificationCount", empNo);
	}
	
	

}
