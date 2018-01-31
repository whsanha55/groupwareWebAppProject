package com.bit.groupware.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.authority.BoardVO;
import com.bit.groupware.persistent.authority.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	public List<BoardVO> retrieveBoard() {
		return boardDAO.selectBoard();
	}

	public void registerBoard(BoardVO board) {
		boardDAO.insertBoard(board);
		
	}

	public void modifyBoard(BoardVO board) {
		boardDAO.updateBoard(board);
		
	}

	public void removeBoard(int boardNo) {
		boardDAO.deleteBoard(boardNo);
	}

}
