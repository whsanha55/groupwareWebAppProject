package com.bit.groupware.controller.authority;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit.groupware.domain.authority.PostFileVO;
import com.bit.groupware.domain.authority.PostVO;
import com.bit.groupware.service.authority.PostService;
import com.bit.groupware.util.UploadFiles;

@Controller
public class RemovePostController {
	private static final Logger logger = LoggerFactory.getLogger(RemovePostController.class);
	@Autowired
	private PostService postService;	

	// �Խñ� ���� ��û�� ó���� ��Ʋ�ѷ� �޼ҵ�
	@RequestMapping(value="/removePost.do", method=RequestMethod.GET)
	public String remove(@RequestParam(value="postNo", required=true)int postNo) {		
		logger.info("������ȣ!!!!!!!!!!!!!!: {}", postNo);
		postService.removePost(postNo);
		
		return "redirect:/postList.do";			
	}

}
