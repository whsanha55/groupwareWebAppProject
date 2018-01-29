package com.bit.groupware.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.EmployeeVO;
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
	public ModelAndView submit(@RequestParam(value="id", required=true) String id) {
		logger.info("id : {}", id);
		EmployeeVO emp = employeeService.retrieveEmployee(id);
		logger.info("emp.getIsAdmin() : {}", emp.getIsAdmin());
		ModelAndView mv = new ModelAndView();
		
		if(emp.getIsAdmin().equals("T")) {
			mv.setViewName("admin/admin_index");
			mv.addObject("msg", "success");
		}else {    // 로그인 실패
            // login.jsp로 이동
			mv.setViewName("index");
			mv.addObject("msg", "failure");
        }
		return mv;
	}
}
