package com.bit.groupware.controller.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.service.employee.MessageService;
import com.bit.groupware.service.employee.NotificationService;

@Controller
public class NotificationController {
	
	@Autowired
	private NotificationService service;
	

	//새 알림 개수 표시용
	@RequestMapping(value="/newNote.do", method=RequestMethod.GET)
	@ResponseBody
	public int getNumber() {
		
//		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		String empNo = user.getUsername();
		
		String empNo = "2018-00011";
		
		return service.retrieveNotificationCount(empNo);
	}
	
	
	
	

	
}
