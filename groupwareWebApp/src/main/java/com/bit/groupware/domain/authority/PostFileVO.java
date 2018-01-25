package com.bit.groupware.domain.authority;

public class PostFileVO {
	private int no;  						//게시글 파일 번호
	private String originalFileName; 	//게시글 파일 기본 이름
	private String systemFileName; 		//게시글 파일 시스템 이름
	private String url; 						//게시글 파일 경로
	private int postNo;					 //게시글 번호
	
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
