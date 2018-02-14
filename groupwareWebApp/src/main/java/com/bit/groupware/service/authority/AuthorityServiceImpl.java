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
	
	//���Ѹ���� ��ȸ�ϴ�.
	public List<AuthorityVO> retrieveAuthorityList(Map<String, Object> map) {
		return authorityDAO.selectAuthorityList(map);
	}

	//������ ����ϴ�.
	public void registerAuthority(AuthorityVO authority) {
		authorityDAO.insertAuthority(authority);
	}

	//������ �����Ѵ�.
	public void modifyAuthority(AuthorityVO authority) {	
		authorityDAO.updateAuthority(authority);	
	}
	//�� �Խñ� ���� ���ϴ�.
	public int retrieveAuthorityCount(Map<String, Object> map) {
		return authorityDAO.selectAuthorityCount(map);
	}

	//���Ѹ���� ��ȸ�ϴ�.
	public AuthorityVO retrieveAuthorityByaNo(String aNo) {
	   return authorityDAO.selectAuthorityByaNo(aNo);
	}

	//���Ѹ��� ���翩�θ� ��ȸ�ϴ�.
	public int retrieveAuthorityByAname(String aName) {
		return authorityDAO.selectAuthorityByAname(aName);
	}

	//������ �ϰ������Ѵ�.
	public void removeAuthority(Map<String, Object> map) {
		authorityDAO.deleteAuthority(map);
		
	}

	//����, ��� ���翩��
	public int retrieveAtuhRoleCount(Map<String, Object> map) {
		return authorityDAO.selectAuthRoleCount(map);
	}
	
	//��������� ��ȸ�ϴ�.
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
