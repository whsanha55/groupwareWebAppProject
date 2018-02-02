package com.bit.groupware.persistent.authority;

import java.util.List;

import com.bit.groupware.domain.authority.BoardVO;

public interface BoardDAO {
	
	//게시판 목록을 조회한다.
	List<BoardVO> selectBoardList();
	
	//게시판을 등록한다.
	int insertBoard(BoardVO board);
	
	//게시판 정보 수정한다.
	//권한이 부여된 사원만 게시판 정보를 수정할 수 있다.
	int updateBoard(BoardVO board);
	
	//게시판을 삭제한다.
	//단, 게시글이 존재할 경우 게시판을 삭제할 수 없다.
	void deleteBoard(int boardNo);

	//게시판을 조회하다.
	BoardVO selectBoard(int boardNO);
	
	//게시글이 여러개인 게시판 조회하다.
	int selectBoardByBoardNo(int boardNo);
	
	//게시판 이름을 조회하다.
	List<BoardVO> selectBoardNameList();
}
