package com.bit.groupware.controller.employee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SignRegisterController {

	@RequestMapping(value="/registerSign.do", method=RequestMethod.GET)
	public String form() {
		return "employee/insertSign"; 
	}

}
