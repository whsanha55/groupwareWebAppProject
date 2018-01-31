package com.bit.groupware.domain.approval;

public class ApprovalCommentVO {

	private int commentNo;
	private ApprovalRecordVO approvalRecord;
	private String commentContent;
	private String commentDate;

	public ApprovalCommentVO() {
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public ApprovalRecordVO getApprovalRecord() {
		return approvalRecord;
	}

	public void setApprovalRecord(ApprovalRecordVO approvalRecord) {
		this.approvalRecord = approvalRecord;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}

}
