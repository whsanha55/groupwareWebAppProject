package com.bit.groupware.controller.authority;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.authority.BoardVO;
import com.bit.groupware.service.authority.BoardService;

@Controller
public class AdminRetrieveBoardController {

	private BoardService boardService;
	
	@ResponseBody
	@RequestMapping(value="boardList.do", method=RequestMethod.GET)
	public  List<BoardVO>retrieve() {
		return boardService.retrieveBoard();
	}
}
