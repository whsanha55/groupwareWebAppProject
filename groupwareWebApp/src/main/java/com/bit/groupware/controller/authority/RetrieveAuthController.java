package com.bit.groupware.controller.authority;

import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class RetrieveAuthController {
	private final static Logger logger = LoggerFactory.getLogger(RetrieveAuthController.class);
	
	/*
	@RequestMapping(value="/retrieveAuth.do", method=RequestMethod.GET)
	public String retriveAuth(Principal principal) {
		String id = principal.getName();
		logger.info("id : " + id);
		return "success";
	}
	*/
	
	
	@RequestMapping(value="/admin/retrieve.do", method=RequestMethod.GET)
	public String retriveAuth() {
	
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		User user = (User)authentication.getPrincipal();
		String id = user.getUsername();
		String pwd = user.getPassword();
		//String  name = user.getName();
		//String deptName = user.getDeptName();
		String str = "";
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>)user.getAuthorities();
		for(GrantedAuthority authority : authorities) {
			str += authority.getAuthority() + "   "; 
		}
		
		logger.info("id : " + id);
		logger.info("pwd : " + pwd);
		//logger.info("name : " + name);
		//logger.info("deptName" + deptName);
		logger.info("authorities : " + str);		
		
		return "success";
	}
	
}















