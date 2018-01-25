package com.bit.groupware.persistent.authority;

public interface BoardDAO {
	
	//게시판 목록을 조회한다.
	List<BoardVO> selectBoard();
	
	//게시판을 등록한다.
	void insertBoard(BoardVO board);
	
	//게시판 정보 수정한다.
	//권한이 부여된 사원만 게시판 정보를 수정할 수 있다.
	void updateBoard(BoardVO board);
	
	//게시판을 삭제한다.
	//단, 게시글이 존재할 경우 게시판을 삭제할 수 없다.
	void deleteBoard(int boardNo);

}
