package com.bit.groupware.controller.authority;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		@ResponseBody
	   public Map<String, Object> submit(
			     @RequestParam(value = "rName") String rName,
				@RequestParam(value = "rExplan") String rExplan, 
				@RequestParam(value = "sortOrder") int sortOrder, 
				@RequestParam(value = "rType") String rType) throws Exception { 
	         
		   int name = roleService.rNameIsExist(rName);
		   Map<String, Object> map = new HashMap<String, Object>();
		   RoleVO role = new RoleVO();
		   role.setrName(rName);
		   role.setrExplan(rExplan);
		   role.setSortOrder(sortOrder);
		   role.setrType(rType);

	      
		   if(name == 0) {
			   roleService.registerRole(role);
			   map.put("isSuccess", "true");
		   }else {
			   map.put("isFail", "false");
		   }
			return map;
	   }
}
