package com.bit.groupware.controller.employee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class ModifyEmployeeAjaxController {
	private final static Logger logger = LoggerFactory.getLogger(ModifyEmployeeAjaxController.class);

	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/checkPwdEmployee.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean modifyEmployee(@RequestParam("checkPwd")String checkPwd) {
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		UserVO user = (UserVO)authentication.getPrincipal();
		String encodePwd = employeeService.retrieveEmployee(user.getUsername()).getEmpPwd();
		logger.info("checkPwd : {}", checkPwd);
		logger.info("encodePwd : {}", encodePwd);
		return passwordEncoder.matches(checkPwd, encodePwd);
	}
}
