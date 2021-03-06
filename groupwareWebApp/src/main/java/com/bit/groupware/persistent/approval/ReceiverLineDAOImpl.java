package com.bit.groupware.persistent.approval;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.approval.ReceiverLineVO;
@Repository
public class ReceiverLineDAOImpl implements ReceiverLineDAO{
	
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.approval.ReceiverLineMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<ReceiverLineVO> selectReceiverLineList(int receiverNo) {
		return sqlSession.selectList(NAMESPACE + ".selectReceiverLineList", receiverNo);
	}

	public void insertReceiverLineList(List<ReceiverLineVO> receiverLines) {
		sqlSession.insert(NAMESPACE + ".insertReceiverLineList", receiverLines);
		
	}

	public void deleteReceiverLines(int receiverNo) {
		sqlSession.delete(NAMESPACE + ".deleteReceiverLines", receiverNo); 
		
	}

	public List<ReceiverLineVO> selectApprovalLineList(int apprNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".selectApprovalLine",apprNo); 
	}

	public List<ReceiverLineVO> selectReceiverLineByApprNo(int apprNo) {
		return sqlSession.selectList(NAMESPACE+".selectReceiverLineByApprNo",apprNo); 
	}
	
	public int selectRetire(int receiverNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".selectRetire",receiverNo); 
	}

	
}
