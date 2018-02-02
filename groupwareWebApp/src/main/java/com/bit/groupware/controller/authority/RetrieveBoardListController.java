package com.bit.groupware.controller.authority;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.authority.BoardVO;
import com.bit.groupware.service.authority.BoardService;

@Controller
public class RetrieveBoardListController {

	@Autowired
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(RetrieveBoardListController.class);
	
	@RequestMapping(value="/menuAjax.do", method=RequestMethod.GET)
	@ResponseBody
	public List<BoardVO> retrieve(){
		logger.info("/////////////////boardNameList//////////////////// : {}" , boardService.retrieveBoardNameList());
		List<BoardVO> boards = boardService.retrieveBoardNameList();
		return boards;
	}
	
	
}
