package com.bit.user.domain.approval;

public class NotificationVO {

	int noteNo;
	EmployeeVO employee;
	// 경로미정
	int redirectPath;
	String noteDate;
	String message;

	public NotificationVO() {
	}

	public int getNoteNo() {
		return noteNo;
	}

	public void setNoteNo(int noteNo) {
		this.noteNo = noteNo;
	}

	public EmployeeVO getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeVO employee) {
		this.employee = employee;
	}

	public int getRedirectPath() {
		return redirectPath;
	}

	public void setRedirectPath(int redirectPath) {
		this.redirectPath = redirectPath;
	}

	public String getNoteDate() {
		return noteDate;
	}

	public void setNoteDate(String noteDate) {
		this.noteDate = noteDate;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "NotificationVO [noteNo=" + noteNo + ", employee=" + employee + ", redirectPath=" + redirectPath
				+ ", noteDate=" + noteDate + ", message=" + message + "]";
	}

}
