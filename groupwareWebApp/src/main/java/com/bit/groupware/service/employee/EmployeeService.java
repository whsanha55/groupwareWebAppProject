package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bit.groupware.domain.employee.DeputyVO;
import com.bit.groupware.domain.employee.EmployeeCodeVO;
import com.bit.groupware.domain.employee.EmployeeCodeViewVO;
import com.bit.groupware.domain.employee.EmployeeVO;

@Service
public interface EmployeeService {
	

	/*EmployeeVO retrieveEmployee(String empNo);

	List<EmployeeVO> retrieveEmployeeList(Map<String,Object> map);
		
	void modifyEmployee(EmployeeVO employee);
	
	int checkDeptEmployee(String cNo);
	
	void registerPhoto(PhotoVO photo);
	
	void removePhoto(String photoNo);
	*/
	List<EmployeeVO> retrieveEmployeeList(Map<String, Object> map);
	
	void registerEmployee(EmployeeVO employee);

	void registerDeputy(DeputyVO deputy);
	
	List<DeputyVO> retrieveDeputyList(Map<String, Object> map);
	
	int retrieveDeputyListCount(Map<String, Object> map);
	
	int retrieveEmployeeCount(Map<String, Object> map);
	
	List<EmployeeVO> retrieveDeputyRegisterEmployeeList(Map<String, Object> map);

	int retrieveDeputyRegisterCount(Map<String, Object> map);
}
