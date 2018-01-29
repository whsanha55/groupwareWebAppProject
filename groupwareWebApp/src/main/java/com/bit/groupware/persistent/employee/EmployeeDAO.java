package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.EmployeeCodeVO;
import com.bit.groupware.domain.employee.EmployeeVO;

public interface EmployeeDAO {

	/*EmployeeVO selectEmployee(String empNo);*/
	
	List<EmployeeVO> selectEmployeeList(Map<String, Object> map);
	
	/*String insertEmployee(EmployeeVO employee);
	
	void updateEmployee(EmployeeVO employee);
	
	void insertEmployeeCode(String empNo);
	
	List<EmployeeCodeVO> selectDepartment(Map<String, Object> map);
	
	int checkDeptEmp(String cNo);*/
}
