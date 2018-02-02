package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.NoticeFileVO;

public interface NoticeFileDAO {
	
	//�������� ���� ���
	void insertNoticeFile(Map<String, Object> map);
	
	//�������� ���� ����
	void deleteNoticeFile(int noticeNo);
	
	//�������� ���� ����Ʈ ����
	void deleteNoticeFileList(Map<String, Object> map);

}
