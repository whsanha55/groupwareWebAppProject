package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.employee.DepartmentVO;
import com.bit.groupware.domain.employee.EmployeeVO;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.employee.EmployeeMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public EmployeeVO selectEmployee(String empNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectEmployeeByNo", empNo);
	}
	
	public List<EmployeeVO> selectEmployeeList(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectEmployeeList", map);
	}

	public List<EmployeeVO> selectEmployeeNameAndDutyList() {
		return sqlSession.selectList(NAMESPACE + ".selectEmployeeNameAndDutyList");
	}

	public String insertEmployee(EmployeeVO employee) {
		sqlSession.insert(NAMESPACE + ".insertEmployee", employee);
		return employee.getEmpNo();
	}

	public String updateEmployee(EmployeeVO employee) {
		sqlSession.update(NAMESPACE + ".updateEmployee", employee);
		return employee.getEmpNo();
	}
	
	public void retireEmployee(String empNo) {
		sqlSession.update(NAMESPACE + ".retireEmployee", empNo);
	}

	public void insertEmployeeCode(Map<String, Object> map) {
		sqlSession.insert(NAMESPACE + ".insertEmployeeCode", map);
	}
	
	public void deleteEmployeeCode(String empNo) {
		sqlSession.delete(NAMESPACE + ".deleteEmployeeCode", empNo);
	}
	
	public int selectEmployeeCount(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".selectEmployeeCount", map);
	}
	
	public void insertAuthority(String empNo) {
		sqlSession.insert(NAMESPACE + ".insertAuthority", empNo);
	}
	
	public void deleteAuthority(String empNo) {
		sqlSession.delete(NAMESPACE + ".deleteAuthority", empNo);
	}
	
	public void insertCodeHistoryProcedure(Map<String, Object> map) {
		sqlSession.insert(NAMESPACE + ".insertCodeHistoryProcedure", map);
	}
	
}
