package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.employee.DeputyVO;
import com.bit.groupware.domain.employee.EmployeeVO;

@Repository
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
	
	public List<EmployeeVO> selectDeputyRegisterEmployeeList(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectDeputyRegisterEmployeeList", map);
	}
	
	public int selectDeputyRegisterCount(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".selectDeputyRegisterCount", map);
	}

}
