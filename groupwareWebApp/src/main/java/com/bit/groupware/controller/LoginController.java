package com.bit.groupware.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.domain.employee.PlanVO;
import com.bit.groupware.service.employee.EmployeeService;
import com.bit.groupware.service.employee.PlanService;

/*@SessionAttributes("id")*/
@Controller
public class LoginController {

	// Logging
	public static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	
	@Autowired 
	private EmployeeService employeeService;
	@Autowired
	private PlanService planService;

	// �α��� �� ��û
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String form() {
		return "login";
	}

	// ����� ����ȭ��
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public ModelAndView form2() {
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cName", user.getDeptName());
		map.put("empNo", user.getUsername());
	
		mv.addObject("plans", planService.retrievePlanListByDeptName(map));
		mv.addObject("employee", employeeService.retrieveEmployee(user.getUsername()));
		mv.setViewName("main");
		return mv;
	}

	// ������ ����ȭ��
	@RequestMapping(value = "/admin/index.do", method = RequestMethod.GET)
	public ModelAndView form3() {
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("employee", employeeService.retrieveEmployee(user.getUsername()));
		mv.setViewName("adminMain");
		return mv;

	}

}