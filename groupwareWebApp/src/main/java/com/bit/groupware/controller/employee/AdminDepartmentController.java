package com.bit.groupware.controller.employee;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.DepartmentVO;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class AdminDepartmentController {
	private static final Logger logger = LoggerFactory.getLogger(AdminDepartmentController.class);
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/admin/listDepartment.do")
	public String form() {
		return "employee/admin_listDepartment";
	}
}
