package com.bit.groupware.persistent.authority;

import java.util.Map;

public interface NoticeFileDAO {
	
	//공지사항 파일 등록
	void insertNoticeFile(Map<String, Object> map);
	
	//공지사항 파일 삭제
	void deleteNoticeFile(int noticeNo);

}
