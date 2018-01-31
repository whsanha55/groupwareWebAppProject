package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bit.groupware.domain.authority.AuthorityVO;
import com.bit.groupware.domain.employee.EmployeeVO;
@Service
public class AuthorityServiceImpl implements AuthorityService {

	public List<AuthorityVO> retrieveAuthorityList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<AuthorityVO> findAuthority(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	public String registerAuthority(AuthorityVO authority) {
		// TODO Auto-generated method stub
		return null;
	}

	public void modifyAuthority(List<AuthorityVO> authority) {
		// TODO Auto-generated method stub
		
	}

	public void removeAuthority(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	public List<EmployeeVO> retrieveAuthEmp(String aNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public void removeAuthEmp(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	public List<AuthorityVO> retrieveAuthorityList(String empNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<AuthorityVO> retrieveAuthServiceList() {
		// TODO Auto-generated method stub
		return null;
	}

}
