package com.bit.groupware.persistent.authority;

import java.util.List;

import com.bit.groupware.domain.authority.BoardVO;

public interface BoardDAO {
	
	//�Խ��� ����� ��ȸ�Ѵ�.
	List<BoardVO> selectBoard();
	
	//�Խ����� ����Ѵ�.
	void insertBoard(BoardVO board);
	
	//�Խ��� ���� �����Ѵ�.
	//������ �ο��� ����� �Խ��� ������ ������ �� �ִ�.
	void updateBoard(BoardVO board);
	
	//�Խ����� �����Ѵ�.
	//��, �Խñ��� ������ ��� �Խ����� ������ �� ����.
	void deleteBoard(int boardNo);

}
