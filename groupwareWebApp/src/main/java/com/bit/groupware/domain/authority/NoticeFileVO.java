package com.bit.groupware.domain.authority;

public class NoticeFileVO {
	private int no;  						//공지사항 파일 번호
	private String originalFileName; 	//공지사항 파일 기본 이름
	private String systemFileName; 		//공지사항 파일 시스템 이름
	private String url; 						//공지사항 파일 경로
	private int noticeNo;					 //공지사항 번호
	
	public NoticeFileVO() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getSystemFileName() {
		return systemFileName;
	}

	public void setSystemFileName(String systemFileName) {
		this.systemFileName = systemFileName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	@Override
	public String toString() {
		return "NoticeFileVO [no=" + no + ", originalFileName=" + originalFileName + ", systemFileName="
				+ systemFileName + ", url=" + url + ", noticeNo=" + noticeNo + "]";
	}
	
}
