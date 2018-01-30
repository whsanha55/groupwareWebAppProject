package com.bit.groupware.controller.employee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DetailEmployeeController {

	@RequestMapping(value="/detailEmployee.do", method=RequestMethod.GET)
	public String detailEmployee()  {
		return "employee/detailEmployee";
	}
}
