package com.bit.groupware.controller.authority;

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
public class AdminModifyAuthorityController {

	@Autowired
	private AuthorityService authorityService;
	
	private final static Logger logger = LoggerFactory.getLogger(AuthorityService.class);
	
	@RequestMapping(value="/retrieveAuthorityAjax.do" , method=RequestMethod.GET)
	@ResponseBody
	public AuthorityVO form(@RequestParam(value="aNo") String aNo){
		AuthorityVO auth = authorityService.retrieveAuthorityByaNo(aNo);
		return auth;
	}
	
	
	@RequestMapping(value="/modifyAuthorityAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public String modify(AuthorityVO authority){
		logger.info("/////////retrieveAuthoriryByaNo///////////" , authority);
	
		authorityService.modifyAuthority(authority);
		return null;
	}
}
