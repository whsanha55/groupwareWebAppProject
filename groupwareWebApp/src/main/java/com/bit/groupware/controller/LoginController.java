package com.bit.groupware.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.employee.EmployeeService;

/*@SessionAttributes("id")*/
@Controller
public class LoginController {

	//Logging
	public static final Logger Logger = LoggerFactory.getLogger(LoginController.class);
	
/*	@Autowired
	private EmployeeService employeeService;*/
	
	//���� �α���
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String form() {
		return "login";
	}
	
	
	//��� ����� �α���
	@RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
	public String form1() {

		return "login";
	}
	
	//����
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String form2() {
		UserVO user = (UserVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    EmployeeVO emp = user.getEmp();
	   /* System.out.println("isAdmin : " + isAdmin);*/
	    
	    if(emp.getIsAdmin().equals("T")) {
	    	return "adminMain";
	    } else {
	    	return "main";
	    }
	
		
	}

	

}

