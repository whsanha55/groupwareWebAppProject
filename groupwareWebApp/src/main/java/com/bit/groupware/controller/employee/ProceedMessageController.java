package com.bit.groupware.controller.employee;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.MessageVO;
import com.bit.groupware.service.employee.MessageService;

@Controller
public class ProceedMessageController {
	
	@Autowired
	private MessageService msgService;
	private MessageVO message;
	// 쪽지함 페이지 요청

	@RequestMapping(value = "/retrieveMessage.do", method = RequestMethod.GET)
	public ModelAndView proceedMsgList() {
		
		// 받은쪽지함 리스트를 보여준다.
		
		ModelAndView mv = new ModelAndView();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("message",message);
		
		mv.addObject("messages", msgService.retrieveMessageList(map));
		mv.setViewName("messageList");
		
		return mv;
	}
	

}
