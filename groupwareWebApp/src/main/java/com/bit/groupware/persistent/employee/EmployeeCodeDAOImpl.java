package com.bit.groupware.persistent.employee;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.employee.EmployeeCodeVO;

@Repository
public class EmployeeCodeDAOImpl implements EmployeeCodeDAO {

	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.employee.EmployeeCodeMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<EmployeeCodeVO> selectEmployeeCodeList() {
		return sqlSession.selectList(NAMESPACE+".selectEmployeeCodeList");
	}

}
