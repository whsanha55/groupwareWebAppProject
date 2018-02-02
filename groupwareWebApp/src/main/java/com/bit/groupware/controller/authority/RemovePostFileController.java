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
public class RemovePostFileController {
	private static final Logger logger = LoggerFactory.getLogger(RemovePostController.class);
	@Autowired
	private PostService postService;	

	// 게시글 쓰기 요청을 처리할 컨틀롤러 메소드
	@RequestMapping(value="/deletePostFile.do", method=RequestMethod.GET)
	@ResponseBody
	public int remove(@RequestParam(value="no", required=true)int no) {		
		logger.info("삭제번호!!!!!!!!!!!!!!: {}", no);
		postService.removePostFile(no);
		
		return 0;			
	}

}
