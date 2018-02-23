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

import com.bit.groupware.domain.authority.AuthorityVO;
import com.bit.groupware.service.authority.AuthorityService;


@Controller
public class AdminRegisterAuthorityController {

	@Autowired
	private AuthorityService authorityService;

	private static final Logger logger = LoggerFactory.getLogger(AdminRegisterAuthorityController.class);

	@RequestMapping(value = "/admin/authority.do", method = RequestMethod.GET)
	public String form() {
		return "authority/admin_authority";
	}

	@RequestMapping(value="/admin/authority.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> submit(@RequestParam(value="aName") String aName, 
												@RequestParam(value="aWhether") String aWhether,
												@RequestParam(value="aNote") String aNote) {
		
		int name = authorityService.retrieveAuthorityByAname(aName); 
		Map<String, Object> map = new HashMap<String, Object>();
		AuthorityVO authority = new AuthorityVO();
		authority.setaName(aName);
		authority.setaWhether(aWhether);
		authority.setaNote(aNote);
		
		if(name == 0) {
			authorityService.registerAuthority(authority);
			map.put("isSuccess", "true");
		}else {
			map.put("isSuccess", "false");
		}
		
		return map;
	}

}
