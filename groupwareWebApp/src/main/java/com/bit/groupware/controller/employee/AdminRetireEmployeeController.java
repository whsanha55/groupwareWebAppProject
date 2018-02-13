package com.bit.groupware.controller.employee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class AdminRetireEmployeeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRetireEmployeeController.class);
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/admin/retireEmployee.do", method=RequestMethod.POST)
	@ResponseBody
	public EmployeeVO retireController(@RequestParam("empNo") String empNo) {
		
		employeeService.retireEmployee(empNo);
		EmployeeVO employee = employeeService.retrieveEmployee(empNo);		
		return employee;
	}
}
