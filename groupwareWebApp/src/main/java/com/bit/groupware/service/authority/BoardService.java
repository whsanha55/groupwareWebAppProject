package com.bit.groupware.service.authority;

import java.util.List;

import com.bit.groupware.domain.authority.BoardVO;

public interface BoardService {
	
	//�Խ��� ����� ��ȸ�Ѵ�.
	List<BoardVO> retrieveBoard(List<BoardVO> boards);
	
	//�Խ����� ����Ѵ�.
	void registerBoard(BoardVO board);
	
	//�Խ��� ���� �����Ѵ�.
	void modifyBoard(BoardVO article);
	
	//�Խ����� �����Ѵ�.(��������)
	void removeBoard(int boardNo);
	
	

}
