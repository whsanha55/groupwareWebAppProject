package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

public interface RoleDAO {
	
	//해당 권한에 역할을 일괄 등록한다.
	void insertAuthRole(Map<String, Object> map);

	//역할을 추가한다.
	void addRole(RoleVO role);
	
	//역할을 일괄수정(등록)한다.
	void insertRole(Map<String, Object> map);
	
	//역할을 일괄 삭제(미등록)한다.
	void nonInsertRole(Map<String, Object> map);
	
	//검색 조건에 해당하는 역할목록을 오름차순으로 조회한다.
	List<RoleVO> searchRole(Map<String , Object> map);
	
	//역할을 롤ID순으로 오름차순 정렬하여 조회한다.
	List<RoleVO> selectRole(Map<String, Integer>);
	
	//역할 정보를 수정한다.
	void updateRole(RoleVO role);
	
	//역할을 삭제한다
	void deleteRole(String roleId);

}
