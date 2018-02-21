package com.bit.groupware.controller.authority;

import java.util.HashMap;
import java.util.Map;

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
public class AdminModifyRoleController {

	@Autowired
	private RoleService roleService;
	
	private final static Logger logger = LoggerFactory.getLogger(AdminModifyRoleController.class);
	
	@RequestMapping(value="/modifyRoleAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> modifyAuth(RoleVO role, @RequestParam(value="rName") String rName, 
			@RequestParam(value="rName1") String rName1){
		int name = roleService.rNameIsExist(rName);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(name == 0) {
			roleService.modifyRole(role);
			map.put("isSuccess", "true");
			map.put("role", role);
		} else {
			if(rName1.equals(rName)) {
				roleService.modifyRole(role);
				map.put("isSuccess", "true");
				map.put("role", role);
			}else {
				map.put("isFail", "false");
			}
		}
		return map;
	}
}
