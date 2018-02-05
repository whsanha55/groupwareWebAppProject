package com.bit.groupware.controller.authority;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.groupware.domain.authority.RoleVO;
import com.bit.groupware.service.authority.RoleService;

@Controller
public class AdminRegisterRoleController {
	 private static final Logger logger = LoggerFactory.getLogger(AdminRegisterRoleController.class);
	  @Autowired
	   private RoleService roleService;

	   //역할 추가 폼 요청
	  @RequestMapping(value="/admin/role.do", method=RequestMethod.GET)
	  public String form() {
		  return "authority/admin_role";
	  }
	  
	   //역할 추가 요청
	   @RequestMapping(value="/admin/role.do", method=RequestMethod.POST)
	   public String submit(RoleVO role, HttpSession session) throws Exception { 
		   logger.info("롤명!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! : {}", role.getrName());
		   logger.info("롤설명!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! : {}", role.getrExplan());
		   logger.info("롤sort!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! : {}", role.getSortOrder());
	      logger.info("타입!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! : {}", role.getrType());
	      roleService.registerRole(role);
	      return "authority/admin_roleList";
	   }
}
