package com.bit.groupware.persistent.authority;

import java.util.List;

import com.bit.groupware.domain.authority.BoardVO;

public interface BoardDAO {
	
	//�Խ��� ����� ��ȸ�Ѵ�.
	List<BoardVO> selectBoardList();
	
	//�Խ����� ����Ѵ�.
	int insertBoard(BoardVO board);
	
	//�Խ��� ���� �����Ѵ�.
	//������ �ο��� ����� �Խ��� ������ ������ �� �ִ�.
	int updateBoard(BoardVO board);
	
	//�Խ����� �����Ѵ�.
	//��, �Խñ��� ������ ��� �Խ����� ������ �� ����.
	void deleteBoard(int boardNo);

	//�Խ����� ��ȸ�ϴ�.
	BoardVO selectBoard(int boardNO);
	
	//�Խñ��� �������� �Խ��� ��ȸ�ϴ�.
	int selectBoardByBoardNo(int boardNo);
	
	//�Խ��� �̸��� ��ȸ�ϴ�.
	List<BoardVO> selectBoardNameList();
}
