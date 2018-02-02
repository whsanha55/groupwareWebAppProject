package com.bit.groupware.domain.authority;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PostVO {
	private int postNo; 					//�Խñ� ��ȣ
	private String postTitle; 				//�Խñ� ����
	private String writer; 					//�ۼ���
	private String postDate; 					//�Խñ� �����
	private String postContent; 			//�Խñ� ����
	private String documentNo; 		//���� ���� ��ȣ
	private String cNo; 					//�μ� �ڵ� ��ȣ
	private String boardNo; 				//�Խ��� ��ȣ
	private List<MultipartFile> upload;
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
	


	public String getPostTitle() {
		return postTitle;
	}


	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}	


	public String getPostDate() {
		return postDate;
	}


	public void setPostDate(String postDate) {
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


	public List<MultipartFile> getUpload() {
		return upload;
	}


	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}


	@Override
	public String toString() {
		return "PostVO [postNo=" + postNo + ", postTitle=" + postTitle + ", writer=" + writer + ", postDate=" + postDate
				+ ", postContent=" + postContent + ", documentNo=" + documentNo + ", cNo=" + cNo + ", boardNo="
				+ boardNo + ", upload=" + upload + ", postFiles=" + postFiles + "]";
	}


	

}
