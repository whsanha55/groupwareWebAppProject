package com.bit.groupware.controller.employee;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class AdminListEmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/admin/listEmployee.do", method=RequestMethod.GET)
	public String form() {
		return "employee/admin_listEmployee";
	}

}
