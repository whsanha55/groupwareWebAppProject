package com.bit.groupware.controller.approval;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ToDoController {
	private static final Logger logger = LoggerFactory.getLogger(ApprovalAjaxController.class);

	// 대기문서함 페이지 요청
	@RequestMapping(value = "/approvalTodo.do", method = RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("approval/toDoList");
		return mv;
	}

}
