package com.bit.groupware.controller.authority;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RetrievePostListController {

	@RequestMapping(value="/postList.do", method=RequestMethod.GET)
	public String form() {
		return "authority/postList";
	}
	
	
}
