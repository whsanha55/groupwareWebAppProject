package com.bit.groupware.controller.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class ModifyEmployeeController {

	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/modifyEmployee.do", method=RequestMethod.GET)
	public ModelAndView detailEmployee()  {
		ModelAndView mv = new ModelAndView();
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		UserVO user = (UserVO)authentication.getPrincipal();
		String empNo = user.getUsername();
		mv.addObject("employee", employeeService.retrieveEmployee(empNo));
		mv.setViewName("employee/modifyEmployeeForm");
		return mv;
	}
	
	@RequestMapping(value="/modifyEmployee.do", method=RequestMethod.POST)
	public String modifyEmployee(EmployeeVO employee) {
		if(employee.getEmpPwd() != null) {
			employee.setEmpPwd(passwordEncoder.encode(employee.getEmpPwd()));
		}
		employeeService.modifyEmployee(employee);
		return "redirect:/detailEmployee.do";
	}
}
