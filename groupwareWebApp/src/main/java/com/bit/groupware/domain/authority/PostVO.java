package com.bit.groupware.domain.authority;

import java.util.ArrayList;
import java.util.List;

public class PostVO {
	private int boardNo; 					//게시판 번호
	private String boardName; 			//게시판 이름
	private String isUse; 					//사용 유무
	private int fileCount; 					//업로드 파일 개수
	private String postContent; 			//게시글 내용
	private String isNotice; 				//공지사항 사용 유무
	private String isComment; 			//코멘트 사용 유무
	private String isDeptDivide; 			//부서 구분 사용 유무
	private String isDocuType; 			//문서 종류 사용 유무
	private List<PostFileVO> postFiles = new ArrayList<PostFileVO>(); //게시글 파일 목록
	
	public PostVO() {
		super();
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public String getIsUse() {
		return isUse;
	}

	public void setIsUse(String isUse) {
		this.isUse = isUse;
	}

	public int getFileCount() {
		return fileCount;
	}

	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getIsNotice() {
		return isNotice;
	}

	public void setIsNotice(String isNotice) {
		this.isNotice = isNotice;
	}

	public String getIsComment() {
		return isComment;
	}

	public void setIsComment(String isComment) {
		this.isComment = isComment;
	}

	public String getIsDeptDivide() {
		return isDeptDivide;
	}

	public void setIsDeptDivide(String isDeptDivide) {
		this.isDeptDivide = isDeptDivide;
	}

	public String getIsDocuType() {
		return isDocuType;
	}

	public void setIsDocuType(String isDocuType) {
		this.isDocuType = isDocuType;
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
		return "PostVO [boardNo=" + boardNo + ", boardName=" + boardName + ", isUse=" + isUse + ", fileCount="
				+ fileCount + ", postContent=" + postContent + ", isNotice=" + isNotice + ", isComment=" + isComment
				+ ", isDeptDivide=" + isDeptDivide + ", isDocuType=" + isDocuType + ", postFiles=" + postFiles + "]";
	}
}
