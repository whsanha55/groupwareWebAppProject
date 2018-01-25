package com.bit.groupware.controller.authority;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DetailNoticeController {

	@RequestMapping(value="/detailNotice.do", method=RequestMethod.GET)
	public String form() {
		return "authority/detailNotice";
	}
	
	
}
