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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	// �Խñ� ���� �� ��û�� ó���� ��Ʋ�ѷ� �޼ҵ�
	@RequestMapping(value = "/addPost.do", method = RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("authority/addPost");
		return mv;
		
	}

	// �Խñ� ���� ��û�� ó���� ��Ʋ�ѷ� �޼ҵ�
	@RequestMapping(value = "/addPost.do", method = RequestMethod.POST)
	public String submit(PostVO post, HttpSession session, RedirectAttributes redirectAttributes,
			@RequestParam(value="boardNo", required = true) int boardNo,
			@RequestParam(value="empName", required = true) String empName,
			@RequestParam(value="boardName", required = true) String boardName,
			@RequestParam(value="department", required = true) String department,
			@RequestParam(value="isComment", required = true) String isComment,
			@RequestParam(value="fileCount", required = true) String fileCount) throws Exception { 
		post.setWriter(empName);	
		
		List<MultipartFile> uploadFiles = post.getUpload();
		for (MultipartFile file : uploadFiles) {
			if (!file.isEmpty()) {				
				ServletContext context = session.getServletContext();

				PostFileVO postFile = UploadFiles.uploadFile2(file, context);
				post.addPostFile(postFile);
			}
		}
		postService.registerPost(post);
		logger.info("�Է�!!!!!!!!!!!!!!!!! : {}", post.getWriter());
		redirectAttributes.addAttribute("boardNo", boardNo);
		redirectAttributes.addAttribute("empName", empName);
		redirectAttributes.addAttribute("boardName", boardName);
		redirectAttributes.addAttribute("department", department);
		redirectAttributes.addAttribute("isComment", isComment);
		redirectAttributes.addAttribute("fileCount", fileCount);
		return "redirect:/postList.do";
	}

}
