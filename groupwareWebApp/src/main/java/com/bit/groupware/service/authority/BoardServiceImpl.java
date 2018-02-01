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
	
	public List<BoardVO> retrieveBoardList() {
		return boardDAO.selectBoardList();
	}

	public int registerBoard(BoardVO board) {
		return boardDAO.insertBoard(board);
		
	}

	public int modifyBoard(BoardVO board) {
		return boardDAO.updateBoard(board);
		
	}

	public void removeBoard(int boardNo) {
		boardDAO.deleteBoard(boardNo);
	}

	public BoardVO retrieveBoard(int boardNo) {
		return boardDAO.selectBoard(boardNo);
	}
	
	

}
