package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.EmployeeCodeVO;
import com.bit.groupware.domain.employee.EmployeeVO;

public interface EmployeeDAO {

	EmployeeVO selectEmployee(String empNo);
	
	Map<String, Object> selectEmployeeList(List<EmployeeVO> employees);
	
	String insertEmployee(EmployeeVO employee);
	
	void updateEmployee(EmployeeVO employee);
	
	Map<String,Object> searchByEmployeeList(List<EmployeeVO> employees);
	
	void insertEmployeeCode(String empNo);
	
	List<EmployeeCodeVO> selectDepartment(Map<String, Object> map);
	
	boolean checkDeptEmp(String cNo);
}
