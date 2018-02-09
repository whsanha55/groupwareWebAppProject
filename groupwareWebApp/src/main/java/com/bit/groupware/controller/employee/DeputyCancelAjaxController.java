package com.bit.groupware.controller.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class DeputyCancelAjaxController {

	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/cancelDeputy.do", method=RequestMethod.POST)
	@ResponseBody
	public String form(@RequestParam("depNo")String depNo) {
		employeeService.removeDeputy(depNo);
		return "success!";
	}
}
