package com.bit.groupware.controller.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RequestListController {

	//���� ��û�� ������ ��û
	@RequestMapping(value="/requestList.do", method=RequestMethod.GET)
	public String form() {
		return "/approval/requestList";
		
	}
}
