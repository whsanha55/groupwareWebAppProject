package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.authority.AuthorityVO;
import com.bit.groupware.persistent.authority.AuthorityDAO;

@Service
public class AuthorityServiceImpl implements AuthorityService {



	@Autowired
	private AuthorityDAO authorityDAO;
	
	//권한목록을 조회하다.
	public List<AuthorityVO> retrieveAuthorityList(Map<String, Object> map) {
		return authorityDAO.selectAuthorityList(map);
	}

	//권한을 등록하다.
	public void registerAuthority(AuthorityVO authority) {
		authorityDAO.insertAuthority(authority);
	}

	//권한을 수정한다.
	public void modifyAuthority(AuthorityVO authority) {	
		authorityDAO.updateAuthority(authority);	
	}
	//총 게시글 수를 구하다.
	public int retrieveAuthorityCount(Map<String, Object> map) {
		return authorityDAO.selectAuthorityCount(map);
	}

	//권한목록을 조회하다.
	public AuthorityVO retrieveAuthorityByaNo(String aNo) {
	   return authorityDAO.selectAuthorityByaNo(aNo);
	}

	//권한명의 존재여부를 조회하다.
	public int retrieveAuthorityByAname(String aName) {
		return authorityDAO.selectAuthorityByAname(aName);
	}

	//권한을 일괄삭제한다.
	public void removeAuthority(Map<String, Object> map) {
		authorityDAO.deleteAuthority(map);
		
	}

	//역할, 사원 존재여부
	public int retrieveAtuhRoleCount(Map<String, Object> map) {
		return authorityDAO.selectAuthRoleCount(map);
	}
	
	//사원정보를 조회하다.
	public List<AuthorityVO> retrieveAuthEmpList(String aNo) {
		return authorityDAO.selectAuthEmpList(aNo);
	}
	
	
}
