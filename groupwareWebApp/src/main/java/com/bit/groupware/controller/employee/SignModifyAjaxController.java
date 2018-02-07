package com.bit.groupware.controller.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class SignModifyAjaxController {

	@Autowired
	private EmployeeService employeeService;
	
}
