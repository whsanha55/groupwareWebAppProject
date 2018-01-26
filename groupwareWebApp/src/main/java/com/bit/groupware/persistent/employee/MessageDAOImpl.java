package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.employee.MessageVO;
@Repository
public class MessageDAOImpl implements MessageDAO {
	private static final String NAMESPACE="com.bit.groupware.persistent.mapper.employee.MessageMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertMessage(MessageVO message) {
		sqlSession.insert(NAMESPACE+".insertMessage",message);
	}

	public void deleteMessageList(Map<String,Object> map) {	
		sqlSession.delete(NAMESPACE+".deleteMessageList",map);
	}

	public MessageVO selectMessage(int msgNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<MessageVO> SelectMessageList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
