package com.bit.groupware.domain.authority;

public class PostFileVO {
	private int no;  						//�Խñ� ���� ��ȣ
	private String originalFileName; 	//�Խñ� ���� �⺻ �̸�
	private String systemFileName; 		//�Խñ� ���� �ý��� �̸�
	private String url; 						//�Խñ� ���� ���
	private int postNo;					 //�Խñ� ��ȣ
	
	public PostFileVO() {
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

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	@Override
	public String toString() {
		return "PostFileVO [no=" + no + ", originalFileName=" + originalFileName + ", systemFileName=" + systemFileName
				+ ", url=" + url + ", postNo=" + postNo + "]";
	}
}
