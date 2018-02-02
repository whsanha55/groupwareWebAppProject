package com.bit.groupware.controller.authority;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.authority.BoardVO;
import com.bit.groupware.service.authority.BoardService;


@Controller
public class AdminModifyBoardController {

	@Autowired
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminModifyBoardController.class);
	
	@RequestMapping(value="/retrieveBoardAjax.do", method=RequestMethod.GET)
	@ResponseBody
	public BoardVO form(@RequestParam(value="boardNo") int boardNo) {
		logger.info("/////////////////boardRetrieve////////////////:  {}" , boardService.retrieveBoard(boardNo));
		BoardVO board = boardService.retrieveBoard(boardNo);
		return board;
	}
	
	@RequestMapping(value="/modifyAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public BoardVO modify(BoardVO board) {
		 /*= boardService.retrieveBoard(board.getBoardNo());*/
		logger.info("==========modfiyBoard==========", board);
		int boardNo = boardService.modifyBoard(board);
		BoardVO boards = new BoardVO(boardNo, board.getBoardName());
		return boards;
	}
	
}
