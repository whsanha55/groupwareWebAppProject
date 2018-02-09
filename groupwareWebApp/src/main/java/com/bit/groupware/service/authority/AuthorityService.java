package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.AuthEmpListVO;
import com.bit.groupware.domain.authority.AuthEmpVO;
import com.bit.groupware.domain.authority.AuthorityVO;

public interface AuthorityService {

	// ���������� ���ѹ�ȣ������ ������������ ��ȸ�Ѵ�.
	List<AuthorityVO> retrieveAuthorityList(Map<String, Object> map);

	//������ �߰��Ѵ�.
	void registerAuthority(AuthorityVO authority);

	// ���������� �����Ѵ�.
	void modifyAuthority(AuthorityVO authority);

	// ������ �ϰ� �����Ѵ�.
	void removeAuthority(Map<String, Object> map);

	// ���, ���� ���翩��
	int retrieveAtuhRoleCount(Map<String, Object> map);
	
	// ���ѹ�ȣ�� �ش��ϴ� ��������� ��� ������ �������� �����Ͽ� ��ȸ�Ѵ�.
	List<AuthorityVO> retrieveAuthEmpList(String aNo);

	//�� �Խñ� ���� ���Ѵ�.
	int retrieveAuthorityCount(Map<String, Object> map);

	//���ѹ�ȣ�� ���� ������ ��ȸ�ϴ�
	AuthorityVO retrieveAuthorityByaNo(String aNo);
	
	//���Ѹ��� ���翩�θ� ��ȸ�ϴ�.
	int retrieveAuthorityByAname(String aName);
	
	//���ѻ���� ����ϴ�.
	void registerAuthEmp(List<AuthEmpVO> list);
	
	//���ѹ�ȣ�� �ش��ϴ� ����� ������ ��ȸ�ϴ�.
	List<AuthEmpListVO> retrieveAuthEmpList(Map<String, Object> map);
	
	int retrieveAuthEmpCount(Map<String, Object> map);
	
	//���� ��� ���翩��
	int retrieveAuthEmpCountByaNo(String aNo);
	
	//���� ����� �����Ѵ�.
	void removeAuthEmp(String aNo);
}
