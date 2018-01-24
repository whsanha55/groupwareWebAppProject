package com.bit.groupware.domain.approval;

import java.util.ArrayList;
import java.util.List;

public class ReceiverLineVO {

	int lineNo;
	ReceiverVO receiver;
	EmployeeVO lineEmployee;
	int lineOrder;
	// 결재 : 0 , 참조 : 1
	int apprType;
	List<ApprovalRecordVO> approvalRecords = new ArrayList<ApprovalRecordVO>();

	public ReceiverLineVO() {
		super();
	}

	public int getLineNo() {
		return lineNo;
	}

	public void setLineNo(int lineNo) {
		this.lineNo = lineNo;
	}

	public ReceiverVO getReceiver() {
		return receiver;
	}

	public void setReceiver(ReceiverVO receiver) {
		this.receiver = receiver;
	}

	public EmployeeVO getLineEmployee() {
		return lineEmployee;
	}

	public void setLineEmployee(EmployeeVO lineEmployee) {
		this.lineEmployee = lineEmployee;
	}

	public int getLineOrder() {
		return lineOrder;
	}

	public void setLineOrder(int lineOrder) {
		this.lineOrder = lineOrder;
	}

	public int isApprType() {
		return apprType;
	}

	public void setApprType(int apprType) {
		this.apprType = apprType;
	}

	public List<ApprovalRecordVO> getApprovalRecords() {
		return approvalRecords;
	}

	public void setApprovalRecords(List<ApprovalRecordVO> approvalRecords) {
		this.approvalRecords = approvalRecords;
	}

	public void addApprovalRecord(ApprovalRecordVO approvalRecord) {
		this.approvalRecords.add(approvalRecord);
	}

	@Override
	public String toString() {
		return "ReceiverLineVO [lineNo=" + lineNo + ", receiver=" + receiver + ", lineEmployee=" + lineEmployee
				+ ", lineOrder=" + lineOrder + ", apprType=" + apprType + ", approvalRecords=" + approvalRecords + "]";
	}

}
