package com.bit.groupware.controller.authority;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.service.authority.PostService;

@SessionAttributes("boardNo")
@Controller
public class PostController {
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@RequestMapping(value="/postList.do", method=RequestMethod.GET)
	public ModelAndView postList(@RequestParam(value = "boardNo") int boardNo) {
		logger.info("°Ô½ÃÆÇ1#################### : {}", boardNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardNo", boardNo);		
		mv.setViewName("authority/postList");
		return mv;
	}

}
