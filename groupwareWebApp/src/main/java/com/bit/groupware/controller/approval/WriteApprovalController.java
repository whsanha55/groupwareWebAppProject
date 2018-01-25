package com.bit.groupware.controller.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WriteApprovalController {
	
	//문서 작성 - 양식 고르기
	@RequestMapping(value="/selectCategory.do", method=RequestMethod.GET)
	public String category() {
		return "approval/selectCategory";
	}
	
	//문서 작성 폼 요청
	@RequestMapping(value="/writeApproval.do", method=RequestMethod.GET) 
	public String form() {
		return "approval/writeApproval";
	}
	
	//문서 상신
	@RequestMapping(value="/writeApproval.do", method=RequestMethod.POST)
	public String submit() {

		//문서 작성 서비스 호출~~ 처리~~
		
		return "redirect:/approval/requestList";
	}


}
