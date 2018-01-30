package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.NoticeVO;

public interface NoticeDAO {
	
	//공지사항 정보를 최근 등록일순으로 조회한다.
	List<NoticeVO> selectNoticeList(Map<String, Integer> map);
	
	//공지사항 정보를 상세 조회한다.
	NoticeVO selectNotice(int noticeNo);
	
	//공지사항 정보를 등록한다.
	//공지사항 번호는 일련번호를 부여한다.
	void insertNotice(NoticeVO notice);
	
	//공지사항 정보를 수정한다.
	//권한이 부여된 사원만 공지사항을 수정할 수 있다.
	void updateNotice(NoticeVO notice);
	
	//공지사항 정보를 삭제한다.
	void deleteNotice(int noticeNo);
	
	//공지사항 정보를 검색한다.
	List<NoticeVO> findNotice(String noticeTitle);

}
