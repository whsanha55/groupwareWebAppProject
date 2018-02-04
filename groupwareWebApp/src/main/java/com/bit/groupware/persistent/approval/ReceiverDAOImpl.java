package com.bit.groupware.persistent.approval;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.approval.ReceiverVO;

@Repository
public class ReceiverDAOImpl implements ReceiverDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.approval.ReceiverMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertReceiver(ReceiverVO receiver) {
		sqlSession.insert(NAMESPACE + ".insertReceiver", receiver);
		return receiver.getReceiverNo();
	}

	public List<ReceiverVO> selectReceiverList(String empNo) {
		return sqlSession.selectList(NAMESPACE + ".selectReceiverList", empNo);
	}

	public void updateReceiver(ReceiverVO receiver) {
		sqlSession.update(NAMESPACE + ".updateReceiver", receiver);
		
	}

	public void deleteReceiver(int receiverNo) {
		sqlSession.update(NAMESPACE + ".deleteReceiver", receiverNo);
		
	}
	
}
