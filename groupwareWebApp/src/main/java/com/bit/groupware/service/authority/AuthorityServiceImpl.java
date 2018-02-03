package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.authority.AuthorityVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.persistent.authority.AuthorityDAO;

@Service
public class AuthorityServiceImpl implements AuthorityService {

	@Autowired
	private AuthorityDAO authorityDAO;
	
	//���Ѹ���� ��ȸ�ϴ�.
	public List<AuthorityVO> retrieveAuthorityList(Map<String, Object> map) {
		return authorityDAO.selectAuthorityList(map);
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

	//�� �Խñ� ���� ���ϴ�.
	public int retrieveAuthorityCount(Map<String, Object> map) {
		return authorityDAO.selectAuthorityCount(map);
	}

	
}
