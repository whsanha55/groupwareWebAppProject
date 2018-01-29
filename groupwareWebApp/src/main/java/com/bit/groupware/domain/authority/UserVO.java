package com.bit.groupware.domain.authority;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.bit.groupware.domain.employee.EmployeeVO;

public class UserVO extends User {
	
	private EmployeeVO emp;
	
	
	public UserVO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		
	}


	public EmployeeVO getEmp() {
		return emp;
	}


	public void setEmp(EmployeeVO emp) {
		this.emp = emp;
	}


	
	
	
}
