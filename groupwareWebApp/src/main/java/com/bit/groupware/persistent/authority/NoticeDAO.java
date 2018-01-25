package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

public interface NoticeDAO {
	
	//�������� ������ �ֱ� ����ϼ����� ��ȸ�Ѵ�.
	List<NoticeVO> selectNoticeList(Map<String, Integer> map);
	
	//�������� ������ �� ��ȸ�Ѵ�.
	NoticeVO selectNotice(int noticeNo);
	
	//�������� ������ ����Ѵ�.
	//�������� ��ȣ�� �Ϸù�ȣ�� �ο��Ѵ�.
	void insertNotice(NoticeVO notice);
	
	//�������� ������ �����Ѵ�.
	//������ �ο��� ����� ���������� ������ �� �ִ�.
	void updateNotice(NoticeVO notice);
	
	//�������� ������ �����Ѵ�.
	void deleteNotice(int noticeNo);

}