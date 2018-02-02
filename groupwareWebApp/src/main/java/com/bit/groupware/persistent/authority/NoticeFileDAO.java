package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.NoticeFileVO;

public interface NoticeFileDAO {
	
	//공지사항 파일 등록
	void insertNoticeFile(Map<String, Object> map);
	
	//공지사항 파일 삭제
	void deleteNoticeFile(int noticeNo);
	
	//공지사항 파일 리스트 삭제
	void deleteNoticeFileList(Map<String, Object> map);

}
