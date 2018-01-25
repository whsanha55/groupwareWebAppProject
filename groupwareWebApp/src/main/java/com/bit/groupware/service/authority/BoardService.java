package com.bit.groupware.service.authority;

import java.util.List;

import com.bit.groupware.domain.authority.BoardVO;

public interface BoardService {
	
	//게시판 목록을 조회한다.
	List<BoardVO> retrieveBoard(List<BoardVO> boards);
	
	//게시판을 등록한다.
	void registerBoard(BoardVO board);
	
	//게시판 정보 수정한다.
	void modifyBoard(BoardVO article);
	
	//게시판을 삭제한다.(삭제여부)
	void removeBoard(int boardNo);
	
	

}
