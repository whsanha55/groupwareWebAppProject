package com.bit.groupware.domain.authority;

import java.util.ArrayList;
import java.util.List;

public class NoticeVO {
	private int noticeNo; 			    // 공지사항 번호
	private String noticeTitle; 		//공지사항 제목
	private int hitCount; 				//공지사항 조회수
	private String noticeDate; 		//공지사항 등록일
	private String noticeContents;  //공지사항 내용
	private List<NoticeFileVO> files = new ArrayList<NoticeFileVO>(); //공지사항 파일 목록
	
	public NoticeVO() {
		super();
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticleTitle() {
		return noticeTitle;
	}

	public void setNoticleTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getNoticeContents() {
		return noticeContents;
	}

	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}

	public List<NoticeFileVO> getFiles() {
		return files;
	}

	public void setFiles(List<NoticeFileVO> files) {
		this.files = files;
	}
	
	public void addNoticeFile(NoticeFileVO file) {
		files.add(file);
	}
	
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", noticleTitle=" + noticeTitle + ", hitCount=" + hitCount
				+ ", noticeDate=" + noticeDate + ", noticeContents=" + noticeContents + ", files=" + files + "]";
	}
}
