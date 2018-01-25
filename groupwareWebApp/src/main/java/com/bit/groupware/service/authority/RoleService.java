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
	
	//�˻� ���ǿ� �ش��ϴ� ���Ҹ���� ��������������ȸ�Ѵ�.
	List<RoleVO> findRole(Map<String , Object> map);
	
	//���Ҹ���� ��ȸ�Ѵ�.
	List<RoleVO> retrieveRole(Map<String, Integer> map);
	
	//���� ������ �����Ѵ�.
	void modifyRole(RoleVO role);
	
	//������ �����Ѵ�.
	void removeRole(String roleId);
	
	

}
