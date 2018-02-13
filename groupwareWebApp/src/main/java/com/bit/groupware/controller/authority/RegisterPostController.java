package com.bit.groupware.controller.authority;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.PostFileVO;
import com.bit.groupware.domain.authority.PostVO;
import com.bit.groupware.service.authority.PostService;
import com.bit.groupware.util.UploadFiles;

@SessionAttributes("boardNo")
@Controller
public class RegisterPostController {
	private static final Logger logger = LoggerFactory.getLogger(RegisterPostController.class);
	@Autowired
	private PostService postService;

	// 게시글 쓰기 폼 요청을 처리할 컨틀롤러 메소드
	@RequestMapping(value = "/addPost.do", method = RequestMethod.GET)
	public ModelAndView form(@RequestParam(value="boardNo", required = true) int boardNo) {
		logger.info("게시판별 입력@@@@@@@@@@@@@@@ : {}", boardNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardNo", boardNo);
		mv.setViewName("authority/addPost");
		return mv;
		
	}

	// 게시글 쓰기 요청을 처리할 컨틀롤러 메소드
	@RequestMapping(value = "/addPost.do", method = RequestMethod.POST)
	public String submit(PostVO post, HttpSession session,
			@RequestParam(value="empName", required = true) String empName) throws Exception { 
		post.setWriter(empName);
		logger.info("입력!!!!!!!!!!!!!!!!! : {}", post);
		List<MultipartFile> uploadFiles = post.getUpload();
		for (MultipartFile file : uploadFiles) {
			if (!file.isEmpty()) {				
				ServletContext context = session.getServletContext();

				PostFileVO postFile = UploadFiles.uploadFile2(file, context);
				post.addPostFile(postFile);
			}
		}
		postService.registerPost(post);
		return "redirect:/postList.do?boardNo=" + post.getBoardNo();
	}

}
