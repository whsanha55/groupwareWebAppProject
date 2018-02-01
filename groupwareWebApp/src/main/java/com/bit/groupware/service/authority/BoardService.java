package com.bit.groupware.service.authority;

import java.util.List;

import com.bit.groupware.domain.authority.BoardVO;

public interface BoardService {
	
	//�Խ��� ����� ��ȸ�Ѵ�.
	List<BoardVO> retrieveBoardList();
	
	//�Խ����� ����Ѵ�.
	int registerBoard(BoardVO board);
	
	//�Խ��� ���� �����Ѵ�.
	int modifyBoard(BoardVO board);
	
	//�Խ����� �����Ѵ�.(��������)
	void removeBoard(int boardNo);
	
	//�Խ����� ��ȸ�Ѵ�. 
	BoardVO retrieveBoard(int boardNo);

}
