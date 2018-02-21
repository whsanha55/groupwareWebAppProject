package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.DepartmentVO;
import com.bit.groupware.domain.employee.EmployeeVO;

public interface EmployeeDAO {

	EmployeeVO selectEmployee(String empNo);
	
	List<EmployeeVO> selectEmployeeList(Map<String, Object> map);
	
	List<EmployeeVO> selectEmployeeNameAndDutyList();
	
	String updateEmployee(EmployeeVO employee);
	
	void insertCodeHistoryProcedure(Map<String,Object> map);
	
	void retireEmployee(String empNo);
	
	String insertEmployee(EmployeeVO employee);
	
	void insertEmployeeCode(Map<String, Object> map);
	
	void deleteEmployeeCode(String empNo);
	
	int selectEmployeeCount(Map<String, Object> map);
	
	void insertAuthority(String empNo);
	
	void deleteAuthority(String empNo);
	 
}
