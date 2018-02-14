package com.bit.groupware.service.authority;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.controller.authority.AdminDesignateAuthorityController;
import com.bit.groupware.domain.authority.AuthEmpListVO;
import com.bit.groupware.domain.authority.AuthEmpVO;
import com.bit.groupware.domain.authority.AuthorityVO;
import com.bit.groupware.persistent.authority.AuthorityDAO;

@Service
public class AuthorityServiceImpl implements AuthorityService {

	private static final Logger logger = LoggerFactory.getLogger(AuthorityServiceImpl.class);

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

	public void registerAuthEmp(Map<String, Object> map) {
		List<AuthEmpVO> addList = (List<AuthEmpVO>) map.get("addList");
		List<AuthEmpVO> removeList = (List<AuthEmpVO>) map.get("removeList");
		
		logger.info("////addList//// {}", addList);
		logger.info("////removeList//// {}", removeList);
		Map<String, Object> map1 = new HashMap<String, Object>();		
		if(addList.size() != 0) {
			map1.put("addList", addList);
			authorityDAO.insertAuthEmp(map1);
		}
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		if(removeList.size() != 0) {
			map2.put("removeList", removeList);
			authorityDAO.deleteAuthEmp(map2);
		}
	
	}

	public List<AuthEmpListVO> retrieveAuthEmpList(Map<String, Object> map) {
		return authorityDAO.selectAuthEmpList(map);
	}

	public int retrieveAuthEmpCount(Map<String, Object> map) {
		return authorityDAO.selectAuthEmpCount(map);
	}

	public int retrieveAuthEmpCountByaNo(String aNo) {
		return authorityDAO.selectAuthEmpCountByaNo(aNo);
	}

	public List<String> retrieveAuthEmpNo(String aNo) {
		return authorityDAO.selectListAuthEmpNo(aNo);
	}

	
	
}
