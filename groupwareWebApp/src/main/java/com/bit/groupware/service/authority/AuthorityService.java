package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.AuthorityVO;
import com.bit.groupware.domain.employee.EmployeeVO;

public interface AuthorityService {

	// ���������� ���ѹ�ȣ������ ������������ ��ȸ�Ѵ�.
	List<AuthorityVO> retrieveAuthorityList(Map<String, Object> map);

	//������ �߰��Ѵ�.
	String registerAuthority(AuthorityVO authority);

	// ���������� �����Ѵ�.
	void modifyAuthority(AuthorityVO authority);

	// ������ �ϰ� �����Ѵ�.
	void removeAuthority(Map<String, Object> map);

	// ���ѹ�ȣ�� �ش��ϴ� ��������� ��� ������ �������� �����Ͽ� ��ȸ�Ѵ�.
	List<EmployeeVO> retrieveAuthEmp(String aNo);

	//�� �Խñ� ���� ���Ѵ�.
	int retrieveAuthorityCount(Map<String, Object> map);

	//���ѹ�ȣ�� ���� ����� ��ȸ�ϴ�.
	List<AuthorityVO> retrieveAuthEmpList(String aNo);
	
	//���ѹ�ȣ�� ���� ������ ��ȸ�ϴ�
	AuthorityVO retrieveAuthorityByaNo(String aNo);
	
	//���Ѹ��� ���翩�θ� ��ȸ�ϴ�.
	int retrieveAuthorityByAname(String aName);
	
}
