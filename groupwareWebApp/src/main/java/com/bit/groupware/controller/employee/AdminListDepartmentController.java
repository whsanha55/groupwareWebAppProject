package com.bit.groupware.controller.employee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminListDepartmentController {

	@RequestMapping(value="/admin/listDepartment.do", method=RequestMethod.GET)
	public String form() {
		return "employee/admin_listDepartment"; 
	}

}
