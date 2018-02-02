package com.bit.groupware.controller.authority;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.bit.groupware.domain.authority.PostFileVO;
import com.bit.groupware.domain.authority.PostVO;
import com.bit.groupware.service.authority.PostService;
import com.bit.groupware.util.UploadFiles;

@Controller
public class RegisterPostController {
	private static final Logger logger = LoggerFactory.getLogger(RegisterPostController.class);
	@Autowired
	private PostService postService;

	// 게시글 쓰기 폼 요청을 처리할 컨틀롤러 메소드
	@RequestMapping(value = "/addPost.do", method = RequestMethod.GET)
	public String form() {
		return "authority/addPost";
	}

	// 게시글 쓰기 요청을 처리할 컨틀롤러 메소드
	@RequestMapping(value = "/addPost.do", method = RequestMethod.POST)
	public String submit(PostVO post, HttpSession session) throws Exception { 
		List<MultipartFile> uploadFiles = post.getUpload();
		for (MultipartFile file : uploadFiles) {
			if (!file.isEmpty()) {
				logger.info("file : {}", file);
				ServletContext context = session.getServletContext();

				PostFileVO postFile = UploadFiles.uploadFile2(file, context);
				post.addPostFile(postFile);
			}
		}
		postService.registerPost(post);
		return "redirect:/postList.do";
	}

}
