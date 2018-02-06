package com.bit.groupware.controller.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class SignRegisterController {

	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/registerSign.do", method=RequestMethod.GET)
	public String form() {
		return "employee/insertSign"; 
	}
	
	@RequestMapping(value="/registerSign.do", method=RequestMethod.POST)
	@ResponseBody
	public String registerAjaxControllger(@RequestParam("empNo")String empNo) {
		empNo = "2018-00018";
		String signName = employeeService.checkSignCount(empNo);
		return signName;
	}

}
