package com.bit.groupware.controller.authority;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String form() {
		System.out.println("call form!!");
		return "home";
	}
}