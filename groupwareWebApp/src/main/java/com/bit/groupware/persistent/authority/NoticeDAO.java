package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.NoticeVO;

public interface NoticeDAO {
	
	//�������� ������ �ֱ� ����ϼ����� ��ȸ�Ѵ�.
	List<NoticeVO> selectNoticeList(Map<String, Object> map);
	
	//�������� ������ ��ȸ�Ѵ�.
	List<NoticeVO> selectNoticeList();
	
	//�������� ������ �� ��ȸ�Ѵ�.
	NoticeVO selectNotice(int noticeNo);
	
	//�������� ������ ����Ѵ�.
	//�������� ��ȣ�� �Ϸù�ȣ�� �ο��Ѵ�.
	int insertNotice(NoticeVO notice);
	
	//�������� ������ �����Ѵ�.
	//������ �ο��� ����� ���������� ������ �� �ִ�.
	void updateNotice(NoticeVO notice);
	
	//�������� ������ �����Ѵ�.
	void deleteNotice(Map<String, Object> map);
	
	//�������� ������ �˻��Ѵ�.
	List<NoticeVO> findNotice(String noticeTitle);
	
	//�� �Խñ� ���� ���Ѵ�.
	int selectNoticeCount(Map<String, Object> map);
	
	//��ȸ���� �����Ѵ�.
	void upHitCount(int noticeNo);
}
