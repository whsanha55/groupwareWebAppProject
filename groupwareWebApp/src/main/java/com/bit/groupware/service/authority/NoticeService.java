package com.bit.groupware.service.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.NoticeVO;

public interface NoticeService {
	
	//공지사항 정보를 조회한다.
	List<NoticeVO> retrieveNoticeList(Map<String, Object> map);
	
	//공지사항 정보를 조회한다.
	List<NoticeVO> retrieveNoticeList();
		
	//공지사항 정보를 상세 조회한다.
	NoticeVO retrieveNotice(int noticeNo);
	
	//공지사항 정보를 등록한다.
	void registerNotice(NoticeVO notice);
	
	//공지사항 정보를 수정한다.
	void modifyNotice(NoticeVO notice);
	
	//공지사항 정보를 삭제한다.
	void removeNotice(Map<String, Object> map);
	
	//총 게시글 수를 구한다.
	 int retrieveNoticeCount(Map<String, Object> map);
	 
	 //공지사항 파일을 삭제한다.
	 void removeNoticeFile(int noticeNo);
	 
	 //조회수를 증가하다.
	 void upHitCount(int noticeNo);
}
