package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.RoleVO;

public interface RoleService {

	// 등록인 경우 해당 역할을 일괄 수정하고 미등록인 경우 해당 역할을 일괄 삭제한다.
	// 해당 권한에 역할을 일괄 등록한다.
	void registerAuthRole(Map<String, Object> map);

	//역할을 추가한다.
	void registerRole(RoleVO role);
	
	//역할목록을 조회한다.
	List<RoleVO> retrieveRoleList(Map<String, Object> map);
	
	//역할목록을 조회한다.
	List<RoleVO> retrieveRoleList();
		
	//역할 정보를 수정한다.
	void modifyRole(RoleVO role);
	
	//역할을 삭제한다.
	void removeRole(Map<String, Object> map);
	
	//총 게시글 수를 구한다.
	int retrieveRoleCount(Map<String, Object> map);
		 

}
