package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.AuthorityVO;

public interface AuthorityDAO {

	// 권한정보를 권한번호순으로 오름차순으로 조회한다.
	List<AuthorityVO> selectAuthorityList(Map<String, Object> map);

	// 권한을 등록한다.
	// 권한 번호는 A + 일련번호(6자리)로 부여한다.
	String insertAuthority(AuthorityVO authority);

	// 권한정보를 수정한다.
	void updateAuthority(AuthorityVO authority);

	// 권한을 일괄 삭제한다.
	void deleteAuthority(Map<String, Object> map);

	// 총 게시글 수를 구한다.
	int selectAuthorityCount(Map<String, Object> map);

	// 권한번호에 대한 사원을 조회하다.
	List<AuthorityVO> selectAuthEmpList(String aNo);

	//권한번호에 해당하는 권한을 조회하다.
	AuthorityVO selectAuthorityByaNo(String aNo);
	
	//권한명의 존재여부를 조회하다.
	int selectAuthorityByAname(String aName);

}
