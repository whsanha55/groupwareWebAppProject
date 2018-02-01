package com.bit.groupware.controller.authority;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.BoardVO;
import com.bit.groupware.service.authority.BoardService;

@Controller
public class AdminRegisterBoardController {
	
	@Autowired
	private BoardService boardService;
	
	private final static Logger logger = LoggerFactory.getLogger(AdminRegisterBoardController.class);
	
	@RequestMapping(value="/admin/board.do", method=RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", boardService.retrieveBoardList());
		logger.info("RetrieveBoard : {}" , boardService.retrieveBoardList());
		mv.setViewName("authority/admin_board");
		return mv;
	}

	
	@RequestMapping(value="/registerBoardAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public BoardVO submit(BoardVO board) {
		logger.info("/////////////////board////////////////:  {}" , board);
		int boardNo = 	boardService.registerBoard(board);
		String boardName = board.getBoardName();
		BoardVO boards = new BoardVO(boardNo,boardName);
	
		return boards;
	}
	
}
