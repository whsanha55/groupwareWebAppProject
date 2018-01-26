package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.groupware.domain.employee.DeputyVO;

public class DeputyDAOImpl implements DeputyDAO {
	private final static String NAMESPACE="com.bit.groupware.persistent.mapper.DeputyMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertDeputy(DeputyVO deputy) {
		sqlSession.insert(NAMESPACE+".insertDeputy",deputy);
	}

	public List<DeputyVO> selectDeputyList(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".selectDeputyList",map);
	}

}
