package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bit.groupware.domain.employee.DeputyVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.domain.employee.PhotoVO;

@Service
public interface EmployeeService {
	
	EmployeeVO retrieveEmployee(String empNo);
	
	List<EmployeeVO> retrieveEmployeeList(Map<String,Object> map);
	
	String registerEmployee(EmployeeVO employee);
	
	void modifyEmployee(EmployeeVO employee);
	
	
	
	int checkDeptEmployee(String cNo);
	
	void registerPhoto(PhotoVO photo);
	
	void removePhoto(String photoNo);
	
	void registerDeputy(DeputyVO deputy);
	
	List<DeputyVO> retrieveDeputyList(Map<String, Object> map);
	
}
