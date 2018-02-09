package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.AuthEmpListVO;
import com.bit.groupware.domain.authority.AuthEmpVO;
import com.bit.groupware.domain.authority.AuthorityVO;

public interface AuthorityService {

	// 권한정보를 권한번호순으로 오름차순으로 조회한다.
	List<AuthorityVO> retrieveAuthorityList(Map<String, Object> map);

	//권한을 추가한다.
	void registerAuthority(AuthorityVO authority);

	// 권한정보를 수정한다.
	void modifyAuthority(AuthorityVO authority);

	// 권한을 일괄 삭제한다.
	void removeAuthority(Map<String, Object> map);

	// 사원, 역할 존재여부
	int retrieveAtuhRoleCount(Map<String, Object> map);
	
	// 권한번호에 해당하는 사원정보를 사번 순으로 오름차순 정렬하여 조회한다.
	List<AuthorityVO> retrieveAuthEmpList(String aNo);

	//총 게시글 수를 구한다.
	int retrieveAuthorityCount(Map<String, Object> map);

	//권한번호에 대한 권한을 조회하다
	AuthorityVO retrieveAuthorityByaNo(String aNo);
	
	//권한명의 존재여부를 조회하다.
	int retrieveAuthorityByAname(String aName);
	
	//권한사원을 등록하다.
	void registerAuthEmp(List<AuthEmpVO> list);
	
	//권한번호에 해당하는 사원의 정보를 조회하다.
	List<AuthEmpListVO> retrieveAuthEmpList(Map<String, Object> map);
	
	int retrieveAuthEmpCount(Map<String, Object> map);
	
	//권한 사원 존재여부
	int retrieveAuthEmpCountByaNo(String aNo);
	
	//권한 사원을 삭제한다.
	void removeAuthEmp(String aNo);
}
