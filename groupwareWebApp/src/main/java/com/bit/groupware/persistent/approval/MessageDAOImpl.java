package com.bit.groupware.persistent.approval;

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

	public void deleteMessage(Map<String,Object> map) {
		sqlSession.delete(NAMESPACE+".deleteMessage",map);
	}

	public MessageVO selectMessage(int msgNo) {
		return sqlSession.selectOne(NAMESPACE+".selectMessage",msgNo); 
	}
	
	
	//메시지 읽음 여부 변경 DAO
	
	public void updateMessageStatus(int msgNO) {
		sqlSession.update(NAMESPACE+".updateMessageStatus", msgNO);	
	}
	

	public List<MessageVO> selectMessageList(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".selectMessageList",map);
	}

	public List<Integer> selectNewMessageCount(String empNo) {
		return sqlSession.selectList(NAMESPACE+".selectNewMessageCount", empNo);
	}

	public int selectMessageCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".selectMessageListCount",map);
	}



	
	
	
}
