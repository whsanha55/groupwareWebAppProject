package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.AuthorityVO;
import com.bit.groupware.domain.employee.EmployeeVO;

public interface AuthorityService {

	// 권한정보를 권한번호순으로 오름차순으로 조회한다.
	List<AuthorityVO> retrieveAuthorityList(Map<String, Integer> map);

	// 검색 조건에 해당하는 정보를 검색한다.
	List<AuthorityVO> findAuthority(Map<String , Object> map);
	
	//권한을 추가한다.
	String registerAuthority(AuthorityVO authority);

	// 권한정보를 일괄 수정한다.
	void modifyAuthority(List<AuthorityVO> authority);

	// 권한을 일괄 삭제한다.
	void removeAuthority(Map<String, Object> map);

	// 권한번호에 해당하는 사원정보를 사번 순으로 오름차순 정렬하여 조회한다.
	List<EmployeeVO> retrieveAuthEmp(String aNo);
	
	//권한번호에 해당하는 사원정보를 일괄 삭제한다.
	void removeAuthEmp(Map<String, Object> map);
	
	//사용자 아이디에 해당하는 권한정보를 조회한다.
	List <AuthorityVO> retrieveAuthorityList(String empNo);
	
	//권한명과 권한번호에 해당하는 역할을 조회한다.
	List<AuthorityVO> retrieveAuthServiceList();
	
	

}
