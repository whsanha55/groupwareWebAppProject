package com.bit.groupware.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.EmployeeVO;

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
	public ModelAndView submit(@ModelAttribute("emp") EmployeeVO emp, SessionStatus status, HttpSession Session) throws Exception {
		return null;
	}


	
}
