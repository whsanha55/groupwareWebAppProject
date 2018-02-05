package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.authority.RoleVO;
import com.bit.groupware.persistent.authority.RoleDAO;
@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDAO roleDAO;
	
	public void registerAuthRole(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	public List<RoleVO> retrieveRoleList() {
		return roleDAO.selectRoleList();
	}

	public void registerRole(RoleVO role) {
		roleDAO.addRole(role);
	}
	public void modifyRole(RoleVO role) {
		// TODO Auto-generated method stub
		
	}

	public void removeRole(Map<String, Object> map) {
		roleDAO.deleteRole(map);
	}

	public List<RoleVO> retrieveRoleList(Map<String, Object> map) {
		return roleDAO.selectRoleList(map);
	}

	public int retrieveRoleCount(Map<String, Object> map) {
		return roleDAO.selectRoleCount(map);
	}

}
