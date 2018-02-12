package com.bit.groupware.controller.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class DeputyStopUseController {

	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/stopUseDeputy.do", method=RequestMethod.POST)
	@ResponseBody
	public String stopController(@RequestParam("depNo")String depNo) {
		employeeService.stopUseDeputy(depNo);
		return "stop";
	}
}
