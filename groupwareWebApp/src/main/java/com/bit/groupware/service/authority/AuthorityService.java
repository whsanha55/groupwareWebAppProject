package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.AuthorityVO;
import com.bit.groupware.domain.employee.EmployeeVO;

public interface AuthorityService {

	// ���������� ���ѹ�ȣ������ ������������ ��ȸ�Ѵ�.
	List<AuthorityVO> retrieveAuthorityList(Map<String, Integer> map);

	// �˻� ���ǿ� �ش��ϴ� ������ �˻��Ѵ�.
	List<AuthorityVO> findAuthority(Map<String , Object> map);
	
	//������ �߰��Ѵ�.
	String registerAuthority(AuthorityVO authority);

	// ���������� �ϰ� �����Ѵ�.
	void modifyAuthority(List<AuthorityVO> authority);

	// ������ �ϰ� �����Ѵ�.
	void removeAuthority(Map<String, Object> map);

	// ���ѹ�ȣ�� �ش��ϴ� ��������� ��� ������ �������� �����Ͽ� ��ȸ�Ѵ�.
	List<EmployeeVO> retrieveAuthEmp(String aNo);
	
	//���ѹ�ȣ�� �ش��ϴ� ��������� �ϰ� �����Ѵ�.
	void removeAuthEmp(Map<String, Object> map);
	
	//����� ���̵� �ش��ϴ� ���������� ��ȸ�Ѵ�.
	List <AuthorityVO> retrieveAuthorityList(String empNo);
	
	//���Ѹ�� ���ѹ�ȣ�� �ش��ϴ� ������ ��ȸ�Ѵ�.
	List<AuthorityVO> retrieveAuthServiceList();
	
	

}
