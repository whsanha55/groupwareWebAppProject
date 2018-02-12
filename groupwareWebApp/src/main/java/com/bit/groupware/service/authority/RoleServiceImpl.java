package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.authority.AuthRoleVO;
import com.bit.groupware.domain.authority.RoleVO;
import com.bit.groupware.persistent.authority.RoleDAO;
@Service
public class RoleServiceImpl implements RoleService {
   @Autowired
   private RoleDAO roleDAO;
   
   public void registerAuthRole(Map<String, Object> map) {
      roleDAO.insertAuthRole(map);
   }

   public void removeAuthRole(Map<String, Object> map) {
      roleDAO.nonInsertAuthRole(map);
   }

   public List<RoleVO> retrieveRoleList(String aName) {
      return roleDAO.selectRoleList(aName);
   }

   public List<RoleVO> retrieveRoleByRname(String aName) {
      return roleDAO.selectRoleByRname(aName);
   }

   public RoleVO retrieveRole(String rId) {
      System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+rId);
      return roleDAO.selectRole(rId);
   }

   public void modifyRoleRegistration(RoleVO role) {
      roleDAO.updateRoleRegistration(role);
   }

public void registerRole(RoleVO role) {
      roleDAO.addRole(role);
   }
   public void modifyRole(RoleVO role) {
      
       roleDAO.updateRole(role);
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
   
   public int rNameIsExist(String rName) {
      return roleDAO.rNameIsExist(rName);
   }

   public int rIdIsExist(AuthRoleVO arole) {
      return roleDAO.rIdIsExist(arole);
   }

   public int aNoIsExist(String rId) {
      return roleDAO.aNoIsExist(rId);
   }

	public void modifyAllIsRegistartion() {
		roleDAO.updateAllIsRegistartion();
	}
	
	public void modifyIsRegistartion(String aNo) {
		roleDAO.updateIsRegistartion(aNo);
	}

}