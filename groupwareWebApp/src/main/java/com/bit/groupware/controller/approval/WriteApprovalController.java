package com.bit.groupware.controller.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WriteApprovalController {
	
	//���� �ۼ� - ��� ����
	@RequestMapping(value="/selectCategory.do", method=RequestMethod.GET)
	public String category() {
		return "approval/selectCategory";
	}
	
	//���� �ۼ� �� ��û
	@RequestMapping(value="/writeApproval.do", method=RequestMethod.GET) 
	public String form() {
		return "approval/writeApproval";
	}
	
	//���� ���
	@RequestMapping(value="/writeApproval.do", method=RequestMethod.POST)
	public String submit() {

		//���� �ۼ� ���� ȣ��~~ ó��~~
		
		return "redirect:/approval/requestList";
	}


}
