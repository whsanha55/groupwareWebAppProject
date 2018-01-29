package com.bit.groupware.domain.authority;

import java.util.ArrayList;
import java.util.List;

public class PostVO {
	private int postNo; 					//�Խñ� ��ȣ
	private String postTiltle; 				//�Խñ� ����
	private String writer; 					//�ۼ���
	private int postDate; 					//�Խñ� �����
	private String postContent; 			//�Խñ� ����
	private String documentNo; 		//���� ���� ��ȣ
	private String cNo; 					//�μ� �ڵ� ��ȣ
	private String boardNo; 				//�Խ��� ��ȣ
	private List<PostFileVO> postFiles = new ArrayList<PostFileVO>(); //�Խñ� ���� ���
	
	public PostVO() {
		super();
	}


	public int getPostNo() {
		return postNo;
	}


	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}


	public String getPostTiltle() {
		return postTiltle;
	}


	public void setPostTiltle(String postTiltle) {
		this.postTiltle = postTiltle;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public int getPostDate() {
		return postDate;
	}


	public void setPostDate(int postDate) {
		this.postDate = postDate;
	}


	public String getPostContent() {
		return postContent;
	}


	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}


	public String getDocumentNo() {
		return documentNo;
	}


	public void setDocumentNo(String documentNo) {
		this.documentNo = documentNo;
	}


	public String getcNo() {
		return cNo;
	}


	public void setcNo(String cNo) {
		this.cNo = cNo;
	}


	public String getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}


	public List<PostFileVO> getPostFiles() {
		return postFiles;
	}

	public void setPostFiles(List<PostFileVO> postFiles) {
		this.postFiles = postFiles;
	}
	
	public void addPostFile(PostFileVO file) {
		postFiles.add(file);
	}


	@Override
	public String toString() {
		return "PostVO [postNo=" + postNo + ", postTiltle=" + postTiltle + ", writer=" + writer + ", postDate="
				+ postDate + ", postContent=" + postContent + ", documentNo=" + documentNo + ", cNo=" + cNo
				+ ", boardNo=" + boardNo + ", postFiles=" + postFiles + "]";
	}


}
