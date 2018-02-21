package com.bit.groupware.controller.approval;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyRequestController {
	private static final Logger logger=LoggerFactory.getLogger(MyRequestController.class);
		
	//���� ��û�� ������ ��û
	@RequestMapping(value="/approvalMyRequest.do", method=RequestMethod.GET)
	public String form() {
		
		return "approval/myRequestList";
	}
	

}