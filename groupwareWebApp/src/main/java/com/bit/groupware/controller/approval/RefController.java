package com.bit.groupware.controller.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RefController {

	//참조 문서함 페이지 요청-- ?? 회수/ 참조? 
	@RequestMapping(value="/approvalRef.do", method=RequestMethod.GET)
	public String form() {
		
		
		return "approval/refList";		
		
	}
	
}
