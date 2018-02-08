package com.bit.groupware.controller.authority;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.PostVO;
import com.bit.groupware.service.authority.PostService;

@SessionAttributes("post")
@Controller
public class DetailPostController {
	private static final Logger logger = LoggerFactory.getLogger(DetailPostController.class);
	@Autowired
	private PostService postService;

	@RequestMapping(value = "/detailPost.do", method = RequestMethod.GET)
	public ModelAndView detailPost(@RequestParam(value = "postNo") int postNo) {
		logger.info("댓글1#################### : {}", postNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("post", postService.retrievePost(postNo));
		mv.setViewName("authority/detailPost");
		return mv;
	}

	// 게시글 수정 요청
	@RequestMapping(value = "/detailPost.do", method = RequestMethod.POST)
	@ResponseBody
	public String submit(@ModelAttribute("post") PostVO post, SessionStatus status, HttpSession session)
			throws Exception {
		logger.info("댓글2#################### : {}", post);
		post.getCmts().clear();		
		
		status.setComplete();
		return "redirect:/detailPost.do?postNo=" + post.getPostNo();

	}

}
