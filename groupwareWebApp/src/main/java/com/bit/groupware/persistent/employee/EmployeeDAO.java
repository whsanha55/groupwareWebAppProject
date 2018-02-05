package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.EmployeeCodeVO;
import com.bit.groupware.domain.employee.EmployeeCodeViewVO;
import com.bit.groupware.domain.employee.EmployeeVO;

public interface EmployeeDAO {


	/*
	List<EmployeeVO> selectEmployeeList(Map<String, Object> map);
	
	List<EmployeeCodeVO> selectDepartment(Map<String, Object> map);
	
	int checkDeptEmp(String cNo);*/
	
	EmployeeVO selectEmployee(String empNo);
	
	List<EmployeeVO> selectEmployeeList(Map<String, Object> map);
	
	List<EmployeeVO> selectEmployeeNameAndDutyList();
	
	String updateEmployee(EmployeeVO employee);
	
	void retireEmployee(String empNo);
	
	String insertEmployee(EmployeeVO employee);
	
	void insertEmployeeCode(Map<String, Object> map);
	
	void deleteEmployeeCode(String empNo);
	
	int selectEmployeeCount(Map<String, Object> map);
	 
}
