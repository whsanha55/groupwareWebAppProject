package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.AuthRoleVO;
import com.bit.groupware.domain.authority.RoleVO;

public interface RoleService {

   // �ش� ���ѿ� ������ �ϰ� ����Ѵ�.
   void registerAuthRole(AuthRoleVO arole);
   
   // �ش� ���ѿ� ������ �ϰ� �����Ѵ�.
   void removeAuthRole(String rId);

   //������ �߰��Ѵ�.
   void registerRole(RoleVO role);
   
   //���Ҹ���� ��ȸ�Ѵ�.
   List<RoleVO> retrieveRoleList(Map<String, Object> map);
   
   //���Ҹ���� ��ȸ�Ѵ�.
   List<RoleVO> retrieveRoleByRname(String aName);
   
   //���Ҹ���� ��ȸ�Ѵ�.
   List<RoleVO> retrieveRoleList(String aName);
   
   //rId�� �ش��ϴ� ������ ��ȸ�Ѵ�.
   RoleVO retrieveRole(String rId);
   
   //���� ������ �����Ѵ�.
   void modifyRole(RoleVO role);
   
   //���� ������ �����Ѵ�.
   void modifyRoleRegistration(RoleVO role);
   
   //������ �����Ѵ�.
   void removeRole(Map<String, Object> map);
   
   //�� �Խñ� ���� ���Ѵ�.
   int retrieveRoleCount(Map<String, Object> map);
       
   //rName �ߺ� ����
   int rNameIsExist(String rName);
   
   //rId �ߺ� ����
   int rIdIsExist(AuthRoleVO arole);
   
   //rId�� �ش��ϴ� ������ �����ϴ��� ����
   int aNoIsExist(String rId);
}