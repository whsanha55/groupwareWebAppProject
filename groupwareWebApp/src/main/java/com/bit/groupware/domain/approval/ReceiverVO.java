package com.bit.groupware.domain.approval;

import java.util.ArrayList;
import java.util.List;

import com.bit.groupware.domain.employee.EmployeeVO;

public class ReceiverVO {
	private int receiverNo;
	private EmployeeVO employee;
	private String receiverName;
	private List<ReceiverLineVO> receiverLines = new ArrayList<ReceiverLineVO>();

	public ReceiverVO() {
	}

	public int getReceiverNo() {
		return receiverNo;
	}

	public void setReceiverNo(int receiverNo) {
		this.receiverNo = receiverNo;
	}

	public EmployeeVO getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeVO employee) {
		this.employee = employee;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public List<ReceiverLineVO> getReceiverLines() {
		return receiverLines;
	}

	public void setReceiverLines(List<ReceiverLineVO> receiverLines) {
		this.receiverLines = receiverLines;
	}

	public void addReceiverLine(ReceiverLineVO receiverLine) {
		this.receiverLines.add(receiverLine);
	}

	@Override
	public String toString() {
		return "ReceiverVO [receiverNo=" + receiverNo + ", employee=" + employee + ", receiverName=" + receiverName
				+ ", receiverLines=" + receiverLines + "]";
	}

}
