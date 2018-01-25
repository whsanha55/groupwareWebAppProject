package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

public interface AuthorityDAO {
	
	//권한정보를 권한번호순으로 오름차순으로 조회한다.
	List<AuthorityVO> selectAuthorityListByAdmin(Map<String, Integer> map);
	
	//검색 조건에 해당하는 정보를 검색한다.
	//검색 조건에 따라 오름차순으로 정렬하여 보여준다.
	List<AuthorityVO> searchAuthority(Map<String , Object> map);
	
	//권한을 추가한다.
	//권한 번호는 A + 일련번호(6자리)로 부여한다.
	String insertAuthority(AuthorityVO authority);
	
	//권한정보를 일괄수정한다.
	void updateAuthority(List<AuthorityVO> authority);
	
	//권한을 일괄 삭제한다.
	void deleteAuthority(Map<String, Object> map);	
	

}
