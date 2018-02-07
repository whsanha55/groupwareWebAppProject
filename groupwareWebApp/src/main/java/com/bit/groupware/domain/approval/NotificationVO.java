package com.bit.groupware.domain.approval;

import com.bit.groupware.domain.employee.EmployeeVO;

public class NotificationVO {

	private int noteNo;
	private EmployeeVO empNoForAlert;
	private int redirectPath;
	private String noteDate;
	private String message;

	public NotificationVO() {
	}

	public int getNoteNo() {
		return noteNo;
	}

	public void setNoteNo(int noteNo) {
		this.noteNo = noteNo;
	}

	public EmployeeVO getEmployee() {
		return empNoForAlert;
	}

	public void setEmployee(EmployeeVO empNoForAlert) {
		this.empNoForAlert = empNoForAlert;
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
		return "NotificationVO [noteNo=" + noteNo + ", empNoForAlert=" + empNoForAlert + ", redirectPath=" + redirectPath
				+ ", noteDate=" + noteDate + ", message=" + message + "]";
	}

}
