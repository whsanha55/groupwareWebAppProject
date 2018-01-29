package com.bit.groupware.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("emp")
@Controller
public class LoginController {

	//Logging
	public static final Logger Logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String form(@RequestParam(value="id", required=true) String id) {
		return "login";
	}
	
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String submit() {
		return "login";
	}


	
}
