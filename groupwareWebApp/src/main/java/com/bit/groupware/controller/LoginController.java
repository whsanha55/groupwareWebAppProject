package com.bit.groupware.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.security.ReloadableFilterInvocationSecurityMetadataSource;
import com.bit.groupware.service.employee.EmployeeService;
import com.bit.groupware.service.employee.PlanService;

@Controller
@SessionAttributes("employee")
public class LoginController {

	// Logging
	public static final Logger logger = LoggerFactory.getLogger(LoginController.class);


	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private PlanService planService;
	@Autowired
	private ReloadableFilterInvocationSecurityMetadataSource metaSource;

	// 로그인 폼 요청
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String form() {
		return "login";
	}

	// 사용자 메인화면
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

	// 관리자 메인화면
	@RequestMapping(value = "/admin/index.do", method = RequestMethod.GET)
	public ModelAndView form3() throws Exception {

		/* metaSource.reload(); */

		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		ModelAndView mv = new ModelAndView();
		mv.addObject("employee", employeeService.retrieveEmployee(user.getUsername()));
		mv.setViewName("adminMain");

		metaSource.reload();

		return mv;

	}

}