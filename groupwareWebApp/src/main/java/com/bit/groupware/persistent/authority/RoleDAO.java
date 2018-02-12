package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.AuthRoleVO;
import com.bit.groupware.domain.authority.RoleVO;

public interface RoleDAO {
   
   //해당 권한에 역할을 일괄 등록한다.
   void insertAuthRole(Map<String, Object> map);
   
   //역할을 일괄 삭제(미등록)한다.
   void nonInsertAuthRole(String aNo);
   
   //역할을 추가한다.
   void addRole(RoleVO role);
   
   //검색 조건에 해당하는 역할목록을 오름차순으로 조회한다.
   List<RoleVO> selectRoleList(Map<String , Object> map);
   
   //역할 목록 조회하다.
   List<RoleVO> selectRoleByRname(String aName);
   
   //역할 목록 조회하다.
   List<RoleVO> selectRoleList(String aName);
   
   //rId에 해당하는 역할을 조회하다.
   RoleVO selectRole(String rId);
   
   //rId에 해당하는 권한을 조회하다.
   int aNoIsExist(String rId);
   
   //rId에 해당하는 등록여부를 수정하다.
   void updateRoleRegistration(RoleVO role);
   
   //역할 정보를 수정한다.
   void updateRole(RoleVO role);
   
   //역할을 삭제한다
   void deleteRole(Map<String, Object> map);
   
   //총 게시글 수를 구한다.
   int selectRoleCount(Map<String, Object> map);
   
   //rName 중복 제거
   int rNameIsExist(String rName);
   
   //rId 중복 제거
   int rIdIsExist(AuthRoleVO arole);
}