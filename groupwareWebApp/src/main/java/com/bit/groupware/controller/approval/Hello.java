package com.bit.groupware.controller.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Hello {
	@RequestMapping("/hi.do")
	public String hello() {
		return "menu/welcome";
	}
}
