package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.DepartmentVO;
import com.bit.groupware.domain.employee.DeputyVO;
import com.bit.groupware.domain.employee.EmployeeVO;

public interface EmployeeService {
	
	void registerSign(EmployeeVO employee);
	
	//void updateSign(String photoNo);
	
	String checkSignCount(String empNo);
	
	EmployeeVO retrieveEmployee(String empNo);

	List<EmployeeVO> retrieveEmployeeList(Map<String, Object> map);
	
	void registerEmployee(EmployeeVO employee);
	
	void modifyEmployee(EmployeeVO employee);
	
	void modifyEmployeeAdmin(EmployeeVO employee);
	
	void retireEmployee(String empNo);

	void registerDeputy(DeputyVO deputy);
	
	List<DeputyVO> retrieveDeputyList(Map<String, Object> map);
	
	List<EmployeeVO> retrieveEmployeeNameAndDutyList();
	
	int retrieveDeputyListCount(Map<String, Object> map);
	
	int retrieveEmployeeCount(Map<String, Object> map);
	
	List<EmployeeVO> retrieveDeputyRegisterEmployeeList(Map<String, Object> map);

	int retrieveDeputyRegisterCount(Map<String, Object> map);
	
	public List<DepartmentVO> retrieveDeptList(Map<String,Object> map);
	
	public Map<String, Object> retrieveDeptInfo(String cNo);
	
	public void modifyHead(Map<String, Object> map);
	
}
