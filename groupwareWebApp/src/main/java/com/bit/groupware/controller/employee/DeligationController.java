package com.bit.groupware.controller.employee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.service.employee.CodeService;

@Controller
public class DeligationController {
	private final static Logger logger=LoggerFactory.getLogger(DeligationController.class);
	@Autowired
	private CodeService codeService;
	
	@RequestMapping(value="/registerDelegation.do",method=RequestMethod.GET)
	public String form() {
		
		return "employee/insertDelegation";
	}
}
