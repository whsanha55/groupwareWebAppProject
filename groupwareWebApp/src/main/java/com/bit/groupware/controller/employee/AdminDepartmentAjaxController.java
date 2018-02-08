package com.bit.groupware.controller.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class AdminDepartmentAjaxController {

	@Autowired
	private EmployeeService employeeService;
	
	public void deptListAjaxController() {
		
	}
	
}
