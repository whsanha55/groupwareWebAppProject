package com.bit.groupware.domain.approval;

import java.util.ArrayList;
import java.util.List;

import com.bit.groupware.domain.employee.EmployeeVO;

public class ReceiverLineVO {

	private int lineNo;
	private ReceiverVO receiver;
	private EmployeeVO lineEmployee;
	private int lineOrder;
	// 결재 : 0 , 참조 : 1
	private int apprType;
	private List<ApprovalRecordVO> approvalRecords = new ArrayList<ApprovalRecordVO>();

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

	public void setApprType(int apprType) {
		this.apprType = apprType;
	}

	public int getApprType() {
		return apprType;
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
