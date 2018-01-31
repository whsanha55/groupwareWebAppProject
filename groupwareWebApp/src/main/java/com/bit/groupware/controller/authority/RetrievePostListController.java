package com.bit.groupware.controller.authority;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.PostVO;
import com.bit.groupware.service.authority.PostService;

@Controller
public class RetrievePostListController {
	@Autowired
	private PostService postService;

	// 게시글 목록 조회 요청
	@RequestMapping(value="/postList.do", method=RequestMethod.GET)
	public ModelAndView retrievePostList() {
		ModelAndView mv = new ModelAndView();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", 1);
		map.put("endRow", 10);
		mv.addObject("posts", postService.retrievePostList(map));
		mv.setViewName("retrievePostList");
		
		return mv;
	}
	
	
}
