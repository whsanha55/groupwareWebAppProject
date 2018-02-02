package com.bit.groupware.controller.authority;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.service.authority.PostService;

@Controller
public class RemovePostFileController {
	private static final Logger logger = LoggerFactory.getLogger(RemovePostFileController.class);
	@Autowired
	private PostService postService;	

	// �Խñ� ���� ��û�� ó���� ��Ʋ�ѷ� �޼ҵ�
	@RequestMapping(value="/deletePostFile.do", method=RequestMethod.GET)
	@ResponseBody
	public int remove(@RequestParam(value="no", required=true)int no) {		
		logger.info("������ȣ!!!!!!!!!!!!!!: {}", no);
		postService.removePostFile(no);
		
		return 0;			
	}

}
