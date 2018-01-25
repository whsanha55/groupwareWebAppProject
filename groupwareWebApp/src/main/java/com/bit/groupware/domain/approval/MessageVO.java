package com.bit.groupware.domain.approval;

public class MessageVO {

	int msgNo;
	EmployeeVO senderEmployee;
	EmployeeVO receipientEmployee;
	String msgDate;
	String msgTitle;
	String msgContent;
	int isRead;
	String senderRemoval;
	String receipientRemoval;

	public MessageVO() {
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	

	public String getMsgDate() {
		return msgDate;
	}

	public void setMsgDate(String msgDate) {
		this.msgDate = msgDate;
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

	public EmployeeVO getSenderEmployee() {
		return senderEmployee;
	}

	public void setSenderEmployee(EmployeeVO senderEmployee) {
		this.senderEmployee = senderEmployee;
	}

	public EmployeeVO getReceipientEmployee() {
		return receipientEmployee;
	}

	public void setReceipientEmployee(EmployeeVO receipientEmployee) {
		this.receipientEmployee = receipientEmployee;
	}

	public int getIsRead() {
		return isRead;
	}

	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}

	public String getSenderRemoval() {
		return senderRemoval;
	}

	public void setSenderRemoval(String senderRemoval) {
		this.senderRemoval = senderRemoval;
	}

	public String getReceipientRemoval() {
		return receipientRemoval;
	}

	public void setReceipientRemoval(String receipientRemoval) {
		this.receipientRemoval = receipientRemoval;
	}

	@Override
	public String toString() {
		return "MessageVO [msgNo=" + msgNo + ", senderEmployee=" + senderEmployee + ", receipientEmployee="
				+ receipientEmployee + ", msgDate=" + msgDate + ", msgTitle=" + msgTitle + ", msgContent=" + msgContent
				+ ", isRead=" + isRead + ", senderRemoval=" + senderRemoval + ", receipientRemoval=" + receipientRemoval
				+ "]";
	}

	


}
