package com.bit.groupware.controller.authority;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PasswordEncoderController {
	@Autowired
	private PasswordEncoder passwordEncoder;
	private final static Logger logger = LoggerFactory.getLogger(PasswordEncoderController.class);
	
	
	@RequestMapping(value="/passwordEncode.do", method=RequestMethod.GET)
	public String  passwordEncode() {
		String rawPassword = "1234";
		String encodedPassword = passwordEncoder.encode(rawPassword);
		logger.info("rawPassword : " + rawPassword);
		logger.info("encodedPassword : " + encodedPassword);
		return "success";
	}
	
}
