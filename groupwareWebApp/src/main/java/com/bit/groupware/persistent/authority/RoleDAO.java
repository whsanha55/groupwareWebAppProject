package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.AuthRoleVO;
import com.bit.groupware.domain.authority.RoleVO;

public interface RoleDAO {
   
   //�ش� ���ѿ� ������ �ϰ� ����Ѵ�.
   void insertAuthRole(Map<String, Object> map);
   
   //������ �ϰ� ����(�̵��)�Ѵ�.
   void nonInsertAuthRole(String aNo);
   
   //������ �߰��Ѵ�.
   void addRole(RoleVO role);
   
   //�˻� ���ǿ� �ش��ϴ� ���Ҹ���� ������������ ��ȸ�Ѵ�.
   List<RoleVO> selectRoleList(Map<String , Object> map);
   
   //���� ��� ��ȸ�ϴ�.
   List<RoleVO> selectRoleByRname(String aName);
   
   //���� ��� ��ȸ�ϴ�.
   List<RoleVO> selectRoleList(String aName);
   
   //rId�� �ش��ϴ� ������ ��ȸ�ϴ�.
   RoleVO selectRole(String rId);
   
   //rId�� �ش��ϴ� ������ ��ȸ�ϴ�.
   int aNoIsExist(String rId);
   
   //rId�� �ش��ϴ� ��Ͽ��θ� �����ϴ�.
   void updateRoleRegistration(RoleVO role);
   
   //���� ������ �����Ѵ�.
   void updateRole(RoleVO role);
   
   //������ �����Ѵ�
   void deleteRole(Map<String, Object> map);
   
   //�� �Խñ� ���� ���Ѵ�.
   int selectRoleCount(Map<String, Object> map);
   
   //rName �ߺ� ����
   int rNameIsExist(String rName);
   
   //rId �ߺ� ����
   int rIdIsExist(AuthRoleVO arole);
}