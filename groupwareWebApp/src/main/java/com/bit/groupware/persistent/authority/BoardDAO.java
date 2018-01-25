package com.bit.groupware.persistent.authority;

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
