package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.employee.EmployeeCodeVO;
import com.bit.groupware.domain.employee.EmployeeVO;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.employee.EmployeeMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*public EmployeeVO selectEmployee(String empNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectEmployee", empNo);
	}*/
	
	public List<EmployeeVO> selectEmployeeList(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectEmployeeList", map);
	}
	/*
	public String insertEmployee(EmployeeVO employee) {
		sqlSession.insert(NAMESPACE + ".insertEmployee", employee);
		return employee.getEmpNo();
	}
	
	public void updateEmployee(EmployeeVO employee) {
		sqlSession.update(NAMESPACE + ".updateEmployee", employee);
	}
	
	public void insertEmployeeCode(String empNo) {
		sqlSession.insert(NAMESPACE + ".insertEmployeeCode", empNo);
	}
	
	public List<EmployeeCodeVO> selectDepartment(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectDepartment", map);
	}
	
	public int checkDeptEmp(String cNo) {
		int deptEmpCount = sqlSession.selectOne(NAMESPACE + ".checkDeptEmp", cNo);
		return deptEmpCount;
	}*/
}
