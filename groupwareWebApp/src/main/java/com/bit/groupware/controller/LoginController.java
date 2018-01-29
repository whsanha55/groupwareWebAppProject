package com.bit.groupware.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String form() {
		return "login";
	}
	

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String submit(@RequestParam(value="id", required=true) String id) {
		logger.info("id : {}", id);
		//String isAdmin = employeeService.retrieveEmployee(id);
		if(isAdmin.equals('T'))
		return "admin/admin_index";
	}
}
