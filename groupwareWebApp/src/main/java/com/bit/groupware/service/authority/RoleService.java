package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.AuthRoleVO;
import com.bit.groupware.domain.authority.RoleVO;

public interface RoleService {

   // 해당 권한에 역할을 일괄 등록한다.
   void registerAuthRole(AuthRoleVO arole);
   
   // 해당 권한에 역할을 일괄 삭제한다.
   void removeAuthRole(String rId);

   //역할을 추가한다.
   void registerRole(RoleVO role);
   
   //역할목록을 조회한다.
   List<RoleVO> retrieveRoleList(Map<String, Object> map);
   
   //역할목록을 조회한다.
   List<RoleVO> retrieveRoleByRname(String aName);
   
   //역할목록을 조회한다.
   List<RoleVO> retrieveRoleList(String aName);
   
   //rId에 해당하는 역할을 조회한다.
   RoleVO retrieveRole(String rId);
   
   //역할 정보를 수정한다.
   void modifyRole(RoleVO role);
   
   //역할 정보를 수정한다.
   void modifyRoleRegistration(RoleVO role);
   
   //역할을 삭제한다.
   void removeRole(Map<String, Object> map);
   
   //총 게시글 수를 구한다.
   int retrieveRoleCount(Map<String, Object> map);
       
   //rName 중복 제거
   int rNameIsExist(String rName);
   
   //rId 중복 제거
   int rIdIsExist(AuthRoleVO arole);
   
   //rId에 해당하는 권한이 존재하는지 여부
   int aNoIsExist(String rId);
}