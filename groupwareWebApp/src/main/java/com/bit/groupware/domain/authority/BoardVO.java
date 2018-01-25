package com.bit.groupware.domain.authority;

public class BoardVO {
	private int boardNo; 			//게시판 번호
	private String boardName;  //게시판 이름
	private String isUse; 			//사용 유무
	private int fileCount; 			//업로드 파일 개수
	private String isNotice; 		//공지사항 사용 유무
	private String isComment; 	//코멘트 사용 유무
	private String isDeptDivide; 	//부서 구분 사용 유무
	private String isDocuType; 	//문서 종류 사용 유무

	public BoardVO() {
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

	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", boardName=" + boardName + ", isUse=" + isUse + ", fileCount="
				+ fileCount + ", isNotice=" + isNotice + ", isComment=" + isComment + ", isDeptDivide=" + isDeptDivide
				+ ", isDocuType=" + isDocuType + "]";
	}
	
}
