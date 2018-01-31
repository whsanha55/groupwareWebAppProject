package com.bit.groupware.controller.authority;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.service.authority.BoardService;

@Controller
public class AdminRegisterAuthorityController {

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/admin/authority.do", method = RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView();

		mv.addObject("boards", boardService.retrieveBoard());
		mv.setViewName("authority/admin_authority");

		return mv;
	}

}
