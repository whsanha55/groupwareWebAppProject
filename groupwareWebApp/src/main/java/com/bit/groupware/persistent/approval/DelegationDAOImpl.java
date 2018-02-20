package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.approval.DelegationVO;
@Repository
public class DelegationDAOImpl implements DelegationDAO {
	private static final Logger logger=LoggerFactory.getLogger(DelegationDAOImpl.class);
	
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.employee.DelegationMapper"; 
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertDelegationList(Map<String,Object> map) {
		sqlSession.insert(NAMESPACE+".insertDelegationList",map);

	}

	public void deleteDelegations(int deleNo) {
		sqlSession.delete(NAMESPACE+".deleteDelegation",deleNo);

	}

	public List<DelegationVO> selectDelegations(Map<String,Object> map) {
		return sqlSession.selectList(NAMESPACE+".selectDeleg" ,map);
	}

	public int selectDelegationsCount(Map<String,Object> map) {
		int count=sqlSession.selectOne(NAMESPACE+".selectDelegCount",map);
		return count;
	}
	
	
	public int selectDelegationIsTmpExist(int tmpNo) {
		return sqlSession.selectOne(NAMESPACE+".checkDelegationIsTmpExist",tmpNo);
	}

	public void updateDelegationDelete(int deleNo) {
		sqlSession.update(NAMESPACE+".updateDelegationDelete",deleNo);
	}   
	
	
}
