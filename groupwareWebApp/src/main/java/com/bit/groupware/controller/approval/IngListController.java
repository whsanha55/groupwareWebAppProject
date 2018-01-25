package com.bit.groupware.controller.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IngListController {
	
	//결재 진행함 페이지 요청
	@RequestMapping(value="/ing.do", method=RequestMethod.GET)
	public String form() {
		return "/approval/ingList";
	}

}
