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
	
	
}
