package com.bit.groupware.controller.approval;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ToDoController {
	
	//대기문서함 페이지 요청
	@RequestMapping(value="/approvalTodo.do", method=RequestMethod.GET)
	public String form() {
		ModelAndView mv=new ModelAndView();
		Map<String,Object> map=new HashMap<String,Object>();
		
		map.put("apprFinalStatus", 0);
		return "approval/toDoList";
	}
	
}
