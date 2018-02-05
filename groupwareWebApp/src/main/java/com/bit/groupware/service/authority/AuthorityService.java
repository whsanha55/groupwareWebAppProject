package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.AuthorityVO;
import com.bit.groupware.domain.employee.EmployeeVO;

public interface AuthorityService {

	// 권한정보를 권한번호순으로 오름차순으로 조회한다.
	List<AuthorityVO> retrieveAuthorityList(Map<String, Object> map);

	//권한을 추가한다.
	String registerAuthority(AuthorityVO authority);

	// 권한정보를 수정한다.
	void modifyAuthority(AuthorityVO authority);

	// 권한을 일괄 삭제한다.
	void removeAuthority(Map<String, Object> map);

	// 권한번호에 해당하는 사원정보를 사번 순으로 오름차순 정렬하여 조회한다.
	List<EmployeeVO> retrieveAuthEmp(String aNo);

	//총 게시글 수를 구한다.
	int retrieveAuthorityCount(Map<String, Object> map);

	//권한번호에 대한 사원을 조회하다.
	List<AuthorityVO> retrieveAuthEmpList(String aNo);
	
	//권한번호에 대한 권한을 조회하다
	AuthorityVO retrieveAuthorityByaNo(String aNo);
	
	//권한명의 존재여부를 조회하다.
	int retrieveAuthorityByAname(String aName);
	
}
