package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.RoleVO;

public interface RoleService {

	// ����� ��� �ش� ������ �ϰ� �����ϰ� �̵���� ��� �ش� ������ �ϰ� �����Ѵ�.
	// �ش� ���ѿ� ������ �ϰ� ����Ѵ�.
	void registerAuthRole(Map<String, Object> map);

	//������ �߰��Ѵ�.
	void registerRole(RoleVO role);
	
	//���Ҹ���� ��ȸ�Ѵ�.
	List<RoleVO> retrieveRoleList(Map<String, Object> map);
	
	//���Ҹ���� ��ȸ�Ѵ�.
	List<RoleVO> retrieveRoleList();
		
	//���� ������ �����Ѵ�.
	void modifyRole(RoleVO role);
	
	//������ �����Ѵ�.
	void removeRole(Map<String, Object> map);
	
	//�� �Խñ� ���� ���Ѵ�.
	int retrieveRoleCount(Map<String, Object> map);
		 

}
