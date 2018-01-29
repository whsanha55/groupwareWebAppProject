package com.bit.groupware.persistent.authority;

import java.util.List;

import com.bit.groupware.domain.employee.EmployeeVO;


public interface UserDAO {
	
	EmployeeVO selectUserById(String id) throws Exception;
	
	List<String> selectAutorities(String id) throws Exception;
	
}
