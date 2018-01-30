package com.bit.groupware.controller.employee;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.DeputyVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class DeputyRegisterController {
		private static final Logger logger = LoggerFactory.getLogger(DeputyRegisterController.class);
		
		@Autowired
		private EmployeeService employeeService;
		
		@RequestMapping(value="/registerDeputy.do",method=RequestMethod.GET)
		public ModelAndView form(EmployeeVO employee) {
			ModelAndView mv = new ModelAndView();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", 1);
			map.put("endRow", 10);
			map.put("empNo", "2018-00018");
			mv.addObject("deputies", employeeService.retrieveDeputyList(map));
			mv.setViewName("employee/insertDeputy");
			return mv;
		}
		
		@RequestMapping(value="/registerDeputy.do", method=RequestMethod.POST)
		public String submit(DeputyVO deputy) throws Exception {
			ModelAndView mv = new ModelAndView();
			employeeService.registerDeputy(deputy);
			return "redirect:/registerDeputy.do";
		}
}
