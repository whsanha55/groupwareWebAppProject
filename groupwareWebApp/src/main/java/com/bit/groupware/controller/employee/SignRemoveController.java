package com.bit.groupware.controller.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class SignRemoveController {

	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/removeSign.do", method=RequestMethod.POST)
	@ResponseBody
	public String removeController() {
		
		SecurityContext context1 = SecurityContextHolder.getContext();
		Authentication authentication = context1.getAuthentication();
		UserVO user = (UserVO)authentication.getPrincipal();
		
		String empNo = user.getUsername();
		
		employeeService.removeSign(empNo);
		return "삭제완료";
	}
}
