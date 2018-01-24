package com.bit.user.domain.approval;

public class MessageVO {

	int msgNo;
	EmployeeVO employee;
	EmployeeVO msgEmployee;
	String msgDate;
	String msgTitle;
	String msgContent;
	boolean isRead;

	public MessageVO() {
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public EmployeeVO getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeVO employee) {
		this.employee = employee;
	}

	public String getMsgDate() {
		return msgDate;
	}

	public void setMsgDate(String msgDate) {
		this.msgDate = msgDate;
	}

	public EmployeeVO getMsgEmployee() {
		return msgEmployee;
	}

	public void setMsgEmployee(EmployeeVO msgEmployee) {
		this.msgEmployee = msgEmployee;
	}

	public String getMsgTitle() {
		return msgTitle;
	}

	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public boolean isRead() {
		return isRead;
	}

	public void setRead(boolean isRead) {
		this.isRead = isRead;
	}

	@Override
	public String toString() {
		return "MessageVO [msgNo=" + msgNo + ", employee=" + employee + ", msgDate=" + msgDate + ", msgEmployee="
				+ msgEmployee + ", msgTitle=" + msgTitle + ", msgContent=" + msgContent + ", isRead=" + isRead + "]";
	}

}
