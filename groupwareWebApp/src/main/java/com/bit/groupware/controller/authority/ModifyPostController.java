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

@SessionAttributes("post")
@Controller
public class ModifyPostController {
	private static final Logger logger = LoggerFactory.getLogger(ModifyPostController.class);
	@Autowired
	private PostService postService;
	
	//게시글 수정 폼 요청
	@RequestMapping(value="/modifyPost.do", method=RequestMethod.GET)
	public ModelAndView form(@RequestParam(value="postNo", required = true) int postNo) {
		logger.info("수정1@@@@@@@@@@@@@@@ : {}", postNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("post", postService.retrievePost(postNo));
		mv.setViewName("authority/modifyPost");
		return mv;
	}
	
	//게시글 수정 요청
	@RequestMapping(value = "/modifyPost.do", method = RequestMethod.POST)
	public String submit(@ModelAttribute("post") PostVO post, 
		SessionStatus status, HttpSession session) throws Exception {
		logger.info("수정2@@@@@@@@@@@@@@@ : {}", post);
		post.getPostFiles().clear();
		List<MultipartFile> uploadFiles = post.getUpload();
		ServletContext context = session.getServletContext();
		for (MultipartFile uploadFile : uploadFiles) {
			if (!uploadFile.isEmpty()) {
				PostFileVO postFile = UploadFiles.uploadFile2(uploadFile, context);
				post.addPostFile(postFile);
			}
		}
		postService.modifyPost(post);
		status.setComplete();
		return "redirect:/detailPost.do?postNo=" + post.getPostNo();
		
	}	

}
