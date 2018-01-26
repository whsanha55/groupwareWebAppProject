package com.bit.groupware.persistent.employee;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.employee.DelegationVO;
@Repository
public class DelegationDAOImpl implements DelegationDAO {

	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.employee.DelegationMapper"; 
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertDelegationList(List<DelegationVO> delegations) {
		sqlSession.insert(NAMESPACE+".insertDelegationList",delegations);

	}

	public void deleteDelegations(List<Integer> deleNos) {
		sqlSession.delete(NAMESPACE+".deleteDelegation",deleNos);

	}

}
