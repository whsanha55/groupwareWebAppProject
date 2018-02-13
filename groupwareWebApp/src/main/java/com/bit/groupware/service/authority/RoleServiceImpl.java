package com.bit.groupware.service.authority;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.authority.AuthRoleVO;
import com.bit.groupware.domain.authority.RoleVO;
import com.bit.groupware.persistent.authority.RoleDAO;
import com.bit.groupware.security.ReloadableFilterInvocationSecurityMetadataSource;


@Service
public class RoleServiceImpl implements RoleService {
	private final static Logger logger = LoggerFactory.getLogger(RoleServiceImpl.class);
   @Autowired
   private RoleDAO roleDAO;
   @Autowired
   private ReloadableFilterInvocationSecurityMetadataSource metaSource;
   
    
   public void registerAuthRole(Map<String, Object> map) {
	  List<AuthRoleVO> list = (List<AuthRoleVO>)map.get("list");
	  List<AuthRoleVO> list2 = (List<AuthRoleVO>)map.get("list2");
	  
	  Map<String, Object> map1 = new HashMap<String, Object>();
	 
	  if(list.size() != 0) {
		  map1.put("list",list);
		  roleDAO.insertAuthRole(map1);
	  }
	  if(list2.size() != 0) {
		  map1.put("list2",list2);
		  roleDAO.nonInsertAuthRole(map1);
	  }
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