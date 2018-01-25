package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

public interface RoleDAO {
	
	//�ش� ���ѿ� ������ �ϰ� ����Ѵ�.
	void insertAuthRole(Map<String, Object> map);

	//������ �߰��Ѵ�.
	void addRole(RoleVO role);
	
	//������ �ϰ�����(���)�Ѵ�.
	void insertRole(Map<String, Object> map);
	
	//������ �ϰ� ����(�̵��)�Ѵ�.
	void nonInsertRole(Map<String, Object> map);
	
	//�˻� ���ǿ� �ش��ϴ� ���Ҹ���� ������������ ��ȸ�Ѵ�.
	List<RoleVO> searchRole(Map<String , Object> map);
	
	//������ ��ID������ �������� �����Ͽ� ��ȸ�Ѵ�.
	List<RoleVO> selectRole(Map<String, Integer>);
	
	//���� ������ �����Ѵ�.
	void updateRole(RoleVO role);
	
	//������ �����Ѵ�
	void deleteRole(String roleId);

}
