package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.NoticeVO;

public interface NoticeService {
	
	//�������� ������ ��ȸ�Ѵ�.
	List<NoticeVO> retrieveNoticeList(Map<String, Object> map);
	
	//�������� ������ �� ��ȸ�Ѵ�.
	NoticeVO retrieveNotice(int noticeNo);
	
	//�������� ������ ����Ѵ�.
	void registerNotice(NoticeVO notice);
	
	//�������� ������ �����Ѵ�.
	void modifyNotice(NoticeVO notice);
	
	//�������� ������ �����Ѵ�.
	void removeNotice(Map<String, Object> map);
	
	 int retrieveNoticeCount(Map<String, Object> map);
}
