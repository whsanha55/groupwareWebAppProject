package com.bit.groupware.controller.authority;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.authority.PostVO;
import com.bit.groupware.service.authority.PostService;

@Controller
public class RetrievePostListController {	
	private static final Logger logger = LoggerFactory.getLogger(RetrievePostListController.class);
	@Autowired
	private PostService postService;

	// 게시글 목록 조회 요청
	@RequestMapping(value = "/PagingAjax1.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getTemplateList(
			@RequestParam int no,
			@RequestParam String keyfield ,
			@RequestParam(required=false) String keyword ,
			@RequestParam int startRow ,
			@RequestParam int endRow ) {
		logger.info("게시판2#################### : {}", no);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		int totalCount = postService.retrievePostCount();
		if(totalCount < endRow) {
			endRow = totalCount;
		}
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<PostVO> posts = postService.retrievePostList(map);
		logger.info("게시판3#################### : {}", posts.toString());
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("totalCount", totalCount);
		returnMap.put("posts", posts);
		
		return returnMap;
	}
	
	
}
