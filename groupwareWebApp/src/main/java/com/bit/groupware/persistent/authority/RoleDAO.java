package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.RoleVO;

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
	List<RoleVO> selectRoleList(Map<String , Object> map);
	
	//���� ��� ��ȸ�ϴ�.
	List<RoleVO> selectRoleList();

	//���� ������ �����Ѵ�.
	void updateRole(RoleVO role);
	
	//������ �����Ѵ�
	void deleteRole(Map<String, Object> map);
	
	//�� �Խñ� ���� ���Ѵ�.
	int selectRoleCount(Map<String, Object> map);
	
}
