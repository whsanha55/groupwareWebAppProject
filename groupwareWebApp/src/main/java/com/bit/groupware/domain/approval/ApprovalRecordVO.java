package com.bit.groupware.domain.approval;

import com.bit.groupware.domain.employee.EmployeeCodeViewVO;

public class ApprovalRecordVO {

	private int recordNo;
	private ApprovalVO approval;
	private ReceiverLineVO receiverLine;
	private int apprStatus;
	private String assignDate;
	private String checkDate;
	// 진행�?: 0 , 결재: 1, 보류: 2 , 반려: 3, ?���? : 4, ??�? : 5
	private String confirmDate;
	private ApprovalCommentVO approvalComment;
	private EmployeeCodeViewVO depEmployee;

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

	public EmployeeCodeViewVO getDepEmployee() {
		return depEmployee;
	}

	public void setDepEmployee(EmployeeCodeViewVO depEmployee) {
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
