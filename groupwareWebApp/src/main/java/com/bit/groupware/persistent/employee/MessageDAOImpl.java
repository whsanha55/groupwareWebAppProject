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

	public void deleteMessage(Map<String,List<Integer>> map) {	
		sqlSession.delete(NAMESPACE+".deleteMessage",map);
	}

	public MessageVO selectMessage(int msgNo) {
		return sqlSession.selectOne(NAMESPACE+".selectMessage",msgNo); 
	}

	public List<MessageVO> selectMessageList(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".selectMessageList",map);
	}

	
}
