package com.bit.groupware.controller.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.bit.groupware.domain.employee.MessageVO;
import com.bit.groupware.service.employee.MessageService;

@Controller
public class RemoveMessageController {
	
	@Autowired
	private MessageService msgService; 
	private MessageVO message;
	
	//�޽��� ���� ��û ó��
	@RequestMapping(value = "/removeMessage.do", method = RequestMethod.GET)
	public String removeMessage(@RequestParam(value="msgNos") List<Integer> msgNos) {
		
		//List<Integer> msgNos
		
		if(msgNos != null) {
		msgService.removeMessage(msgNos);
		}
		//ajax�� �־��� �޽��� ���� ����/���� jsp		
		return "isSuccess";
	}
	
}
