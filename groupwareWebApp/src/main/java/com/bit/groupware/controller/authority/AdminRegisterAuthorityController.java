package com.bit.groupware.controller.authority;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String submit(AuthorityVO authority) {
		logger.info("/////////////////authority///////////////////////", authority);
		authorityService.registerAuthority(authority);
		return "redirect:/admin/authorityList.do";
	}

}
