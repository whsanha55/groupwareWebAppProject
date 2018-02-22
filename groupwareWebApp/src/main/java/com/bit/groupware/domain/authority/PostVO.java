package com.bit.groupware.domain.authority;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PostVO {
	private int postNo; 					//게시글 번호
	private String postTitle; 				//게시글 제목
	private String writer; 					//작성자
	private String postDate; 					//게시글 등록일
	private String postContent; 			//게시글 내용
	private String documentNo; 				//문서 종류 번호
	private String cNo; 					//부서 코드 번호
	private int boardNo; 				//게시판 번호
	private int recnt;					//게시글 댓글 수
	private List<MultipartFile> upload;
	private List<PostFileVO> postFiles = new ArrayList<PostFileVO>(); //게시글 파일 목록
	private List<CmtVO> cmts = new ArrayList<CmtVO>(); //게시글 파일 목록
	
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


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
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


	public List<CmtVO> getCmts() {
		return cmts;
	}


	public void setCmts(List<CmtVO> cmts) {
		this.cmts = cmts;
	}
	
	


	public int getRecnt() {
		return recnt;
	}


	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}


	@Override
	public String toString() {
		return "PostVO [postNo=" + postNo + ", postTitle=" + postTitle + ", writer=" + writer + ", postDate=" + postDate
				+ ", postContent=" + postContent + ", documentNo=" + documentNo + ", cNo=" + cNo + ", boardNo="
				+ boardNo + ", upload=" + upload + ", postFiles=" + postFiles + ", cmts=" + cmts + "]";
	}


	


	

}
