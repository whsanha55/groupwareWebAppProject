package com.bit.groupware.controller.authority;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminRetrieveAuthorityController {

	@RequestMapping(value="/admin/admin_authority.do", method=RequestMethod.GET)
	public String form() {
		return "admin_header/authority/admin_authority";
	}
	
	
}
