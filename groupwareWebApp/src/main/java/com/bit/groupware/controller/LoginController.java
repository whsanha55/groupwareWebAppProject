package com.bit.groupware.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
<<<<<<< HEAD
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.employee.EmployeeService;
=======
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
>>>>>>> branch 'master' of https://github.com/whsanha55/groupwareWebAppProject.git


import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.employee.EmployeeService;

@SessionAttributes("id")
@Controller
public class LoginController {
<<<<<<< HEAD
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
=======

	//Logging
	public static final Logger Logger = LoggerFactory.getLogger(LoginController.class);
	
>>>>>>> branch 'master' of https://github.com/whsanha55/groupwareWebAppProject.git
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String form() {
		return "login";
	}
	
<<<<<<< HEAD
/*
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView submit(@RequestParam(value="id", required=true) String id) {
		logger.info("id : {}", id);
		EmployeeVO emp = employeeService.retrieveEmployee(id);
		logger.info("emp.getIsAdmin() : {}", emp.getIsAdmin());
		ModelAndView mv = new ModelAndView();
		
		if(emp.getIsAdmin().equals("T")) {
			mv.setViewName("authority/admin_index");
			mv.addObject("msg", "success");
		}else {    // 로그인 실패
            // login.jsp로 이동
			mv.setViewName("authority/index");
			mv.addObject("msg", "failure");
        }
		return mv;
	}*/
=======
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String submit(@ModelAttribute("id") String id) throws Exception {

		EmployeeVO emp = employeeService.retrieveEmployee(id);
		if(emp.getIsAdmin().equals('T')) {
			Logger.info("emp : {}" , emp);
			return "adminMain";
		}else {
			return "main";
		}
		
	}


	
>>>>>>> branch 'master' of https://github.com/whsanha55/groupwareWebAppProject.git
}
