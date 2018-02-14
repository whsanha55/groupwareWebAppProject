package com.bit.groupware.controller.employee;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.domain.employee.DeputyVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.employee.CodeService;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class DeputyRegisterController {
	private static final Logger logger = LoggerFactory.getLogger(DeputyRegisterController.class);
		
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private CodeService codeService;
	
	@RequestMapping(value="/registerDeputy.do",method=RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView();
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		UserVO user = (UserVO)authentication.getPrincipal();
		mv.addObject("deptCodes", codeService.retrieveDeptCodeList());
		mv.addObject("empNo", user.getUsername());
		mv.setViewName("employee/insertDeputy");
		return mv;
	}
	
/*	
	@RequestMapping(value="/registerDeputy.do",method=RequestMethod.GET)
	public ModelAndView form(EmployeeVO employee) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", "2018-00018");
		mv.addObject("deputies", employeeService.retrieveDeputyList(map));
		mv.addObject("deptCodes", codeService.retrieveDeptCodeList());
		mv.addObject("empNo","2018-00018");
		mv.setViewName("employee/insertDeputy");
		return mv;
	}
*/
	@RequestMapping(value="/registerDeputy.do", method=RequestMethod.POST)
	public String submit(DeputyVO deputy) {
		logger.info("11!!!!!!!!!!"+deputy.getStartDate()); 
		deputy.getStartDate().replace("鰍 ","/");
		deputy.getStartDate().replace("杉 ","/");
		deputy.getStartDate().replace("析","/");
		deputy.getStartDate().replace("獣","");
		deputy.getEndDate().replace("鰍 ", "/");
		deputy.getEndDate().replace("杉 ", "/");
		deputy.getEndDate().replace("析", "/");
		deputy.getEndDate().replace("獣", "");
		
		logger.info("せせせせせせせ"+deputy.getEndDate()); 
		employeeService.registerDeputy(deputy);
		return "redirect:registerDeputy.do";
	}
	
}
