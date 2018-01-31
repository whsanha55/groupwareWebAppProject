package com.bit.groupware.controller.authority;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.groupware.domain.authority.BoardVO;
import com.bit.groupware.service.authority.BoardService;

@Controller
public class AdminRegisterBoardController {
	
	@Autowired
	private BoardService boardService;
	
	private final static Logger logger = LoggerFactory.getLogger(AdminRegisterBoardController.class);
	
	
	@RequestMapping(value="/admin/board.do", method=RequestMethod.GET)
	public String form() {
		
		return "authority/admin_board";
	}

	@RequestMapping(value="/admin/board.do", method=RequestMethod.POST)
	public String submit(BoardVO board) {
		logger.info("board zxzzzzzzzzzzzzzzzzzzzzzzzzzz:  {}" , board);
		boardService.registerBoard(board);
		return "authority/admin_board";
	}
	

	
}
