package com.bit.groupware.domain.approval;

public class ApprovalRecordVO {

	int recordNo;
	ApprovalVO approval;
	ReceiverLineVO receiverLine;
	int apprStatus;
	String assignDate;
	String checkDate;
	// ì§„í–‰ì¤?: 0 , ê²°ìž¬: 1, ë³´ë¥˜: 2 , ë°˜ë ¤: 3, ? „ê²? : 4, ??ê²? : 5
	String confirmDate;
	ApprovalCommentVO approvalComment;
	EmployeeVO depEmployee;

	public ApprovalRecordVO() {
		super();
	}

	public int getRecordNo() {
		return recordNo;
	}

	public void setRecordNo(int recordNo) {
		this.recordNo = recordNo;
	}

	public ApprovalVO getApproval() {
		return approval;
	}

	public void setApproval(ApprovalVO approval) {
		this.approval = approval;
	}

	public ReceiverLineVO getReceiverLine() {
		return receiverLine;
	}

	public void setReceiverLine(ReceiverLineVO receiverLine) {
		this.receiverLine = receiverLine;
	}

	public int getApprStatus() {
		return apprStatus;
	}

	public void setApprStatus(int apprStatus) {
		this.apprStatus = apprStatus;
	}

	public String getAssignDate() {
		return assignDate;
	}

	public void setAssignDate(String assignDate) {
		this.assignDate = assignDate;
	}

	public String getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}

	public String getConfirmDate() {
		return confirmDate;
	}

	public void setConfirmDate(String confirmDate) {
		this.confirmDate = confirmDate;
	}

	public ApprovalCommentVO getApprovalComment() {
		return approvalComment;
	}

	public void setApprovalComment(ApprovalCommentVO approvalComment) {
		this.approvalComment = approvalComment;
	}

	public EmployeeVO getDepEmployee() {
		return depEmployee;
	}

	public void setDepEmployee(EmployeeVO depEmployee) {
		this.depEmployee = depEmployee;
	}

	@Override
	public String toString() {
		return "ApprovalRecordVO [recordNo=" + recordNo + ", approval=" + approval + ", receiverLine=" + receiverLine
				+ ", apprStatus=" + apprStatus + ", assignDate=" + assignDate + ", checkDate=" + checkDate
				+ ", confirmDate=" + confirmDate + ", approvalComment=" + approvalComment + ", depEmployee="
				+ depEmployee + "]";
	}

}
