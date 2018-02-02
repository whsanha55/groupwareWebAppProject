package com.bit.groupware.controller.authority;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.service.authority.PostService;

@Controller
public class DetailPostController {
	@Autowired
	private PostService postService;

	@RequestMapping(value="/detailPost.do", method=RequestMethod.GET)
	public ModelAndView detailPost(@RequestParam(value="postNo") int postNo) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("post", postService.retrievePost(postNo));
		mv.setViewName("authority/detailPost");		
		return mv;
	}
	
	
}
