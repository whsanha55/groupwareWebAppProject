package com.bit.groupware.persistent.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.approval.ApprovalFileVO;
@Repository
public class ApprovalFileDAOImpl implements ApprovalFileDAO {
	private static final String NAMESPACE="com.bit.groupware.persistent.mapper.approval.ApprovalFileMapper.xml";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertApprovalFileList(List<ApprovalFileVO> approvalFiles) {
		
		//map 으로 매핑해서 넘김.
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("approvalFiles", approvalFiles);		
		sqlSession.insert(NAMESPACE+".insertApprovalFile", map); 

	}

	public void deleteApprovalFiles(int apprNo) {
		sqlSession.delete(NAMESPACE+".deleteApprovalFile",apprNo);
	}

}
