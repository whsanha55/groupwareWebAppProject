package com.bit.groupware.controller.authority;


import java.util.List;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.groupware.domain.authority.RoleVO;
import com.bit.groupware.service.authority.RoleService;


@Controller
public class AdminDesignateRoleController {

	@Autowired
	private RoleService roleService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDesignateRoleController.class);
	
	@RequestMapping(value="/admin/modifyDesignate.do", method=RequestMethod.POST)
	   public String submit(List<RoleVO> role) throws Exception { 
		logger.info("/////////////////role////////////////:  {}" ,role.toString());
	    //  roleService.registerRole(role);
	      return "authority/admin_authorityList";
	   }
}
