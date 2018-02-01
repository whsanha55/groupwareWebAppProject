package com.bit.groupware.controller.authority;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.service.authority.BoardService;

@Controller
public class AdminRemoveBoardController {
	
	@Autowired
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminModifyBoardController.class);
	
	@RequestMapping(value="/removeAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> remove(@RequestParam(value="boardNo") int boardNo) {
		logger.info("//////////////retrieveBoardByBoardNo /////////////////: {}" , boardService.retrieveBoardByBoardNo(boardNo));
		int no = boardService.retrieveBoardByBoardNo(boardNo);
		
		Map<String, String> map = new HashMap<String, String>();
		if(no == 0) {
			logger.info("삭제성공");
			boardService.removeBoard(boardNo);
			map.put("isSuccess", "true");
		} else {
			map.put("isSuccess", "false");
		}
		return map;
		
	}

}
