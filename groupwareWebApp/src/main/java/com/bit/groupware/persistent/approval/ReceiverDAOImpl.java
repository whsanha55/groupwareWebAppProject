package com.bit.groupware.persistent.approval;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.approval.ReceiverVO;

@Repository
public class ReceiverDAOImpl implements ReceiverDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.approval.ReceiverMapper.xml";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertReceiver(ReceiverVO receiver) {
		sqlSession.insert(NAMESPACE + ".insertReceiver", receiver);
		return receiver.getReceiverNo();
	}

	public List<ReceiverVO> selectReceiverList() {
		return sqlSession.selectList(NAMESPACE + ".selectReceiverList");
	}

	public void updateReceiver(ReceiverVO receiver) {
		sqlSession.insert(NAMESPACE + ".updateReceiver", receiver);
		
	}

	public void deleteReceiver(int receiverNo) {
		sqlSession.insert(NAMESPACE + ".deleteReceiver", receiverNo);
		
	}
	
}
