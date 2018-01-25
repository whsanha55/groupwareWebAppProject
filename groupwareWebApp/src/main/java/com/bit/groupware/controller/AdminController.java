package com.bit.groupware.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

	@RequestMapping(value = "/admin/index.do", method = RequestMethod.GET)
	public String form() {
		return "adminMain";
	}

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String form1() {
		return "main";
	}
}
