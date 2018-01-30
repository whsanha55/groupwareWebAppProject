package com.bit.groupware.controller.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class AdminRegisterEmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/admin/registerEmployee.do",method=RequestMethod.GET)
	public String form() {
		return "employee/admin_insertEmployeeForm";
	}
	
	@RequestMapping(value="/admin/registerEmployee.do", method=RequestMethod.POST)
	public String submit() {
		EmployeeVO employee = new EmployeeVO();
		employeeService.registerEmployee(employee);
		return "redirect:/admin/listEmployee.do";
	}
}
