package com.bit.groupware.controller.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class AdminDepartmentAjaxController {

	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/admin/deptListAjax.do", method=RequestMethod.POST)
	public void deptListAjaxController(@RequestParam("oldHead")String oldHead,
									   @RequestParam("newHead")String newHead) {
		
//		employeeService.up
	}
	
}
