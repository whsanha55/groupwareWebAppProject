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
import org.springframework.web.bind.annotation.ResponseBody;
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

		deputy.getStartDate().replace("년 ","/");
		deputy.getStartDate().replace("월 ","/");
		deputy.getStartDate().replace("일","/");
		deputy.getStartDate().replace("시","");
		deputy.getEndDate().replace("년 ", "/");
		deputy.getEndDate().replace("월 ", "/");
		deputy.getEndDate().replace("일", "/");
		deputy.getEndDate().replace("시", "");
		
		employeeService.registerDeputy(deputy);
		return "redirect:registerDeputy.do";
	}
	
	@RequestMapping(value="/checkDeputy.do" ,method=RequestMethod.POST)
	@ResponseBody
	public int check(@RequestParam(value="startDate") String startDate,
					 @RequestParam(value="endDate") String endDate) {
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		UserVO user = (UserVO)authentication.getPrincipal();
		String empNo=user.getUsername();
		
		startDate=startDate.substring(0, 10);
		endDate=endDate.substring(0, 10);
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("empNo", empNo);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		return employeeService.retrieveDeputyCheck(map); 
	}
	
}
