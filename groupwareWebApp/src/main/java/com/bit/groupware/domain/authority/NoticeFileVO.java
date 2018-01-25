package com.bit.groupware.domain.authority;

public class NoticeFileVO {
	private int no;  						//�������� ���� ��ȣ
	private String originalFileName; 	//�������� ���� �⺻ �̸�
	private String systemFileName; 		//�������� ���� �ý��� �̸�
	private String url; 						//�������� ���� ���
	private int noticeNo;					 //�������� ��ȣ
	
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
