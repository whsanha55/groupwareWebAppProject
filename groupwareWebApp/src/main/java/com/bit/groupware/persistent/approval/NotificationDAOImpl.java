package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.approval.NotificationVO;

@Repository
public class NotificationDAOImpl implements NotificationDAO {
	
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.approval.NotificationMapper";

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<NotificationVO> selectNotificationList(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectNotificationList", map);
	}

	public void deleteNotification(Map<String, Object> map) {
		sqlSession.delete(NAMESPACE + ".deleteNotification", map);
		
	}

	public int selectNotificationCount(String empNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectNotificationCount", empNo);
	}
	
	//알림사항 DB에 반영
	public void insertNotificationProcess(Map<String, Object> map) {
		sqlSession.insert(NAMESPACE + ".insertNotificationProcess", map);
	}
	//알림사항 DB에 반영
	public void insertNotificationEnd(Map<String, Object> map) {
		sqlSession.insert(NAMESPACE + ".insertNotificationEnd", map);
	}
	
	
	
	
	

}
