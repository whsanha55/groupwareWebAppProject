package com.bit.groupware.domain.employee;

public class EmployeeCodeViewVO {
	
	private String checkAdmin;
	private String department;
	private String duty;
	private PhotoVO sign;
	private PhotoVO picture;
	
	public EmployeeCodeViewVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getCheckAdmin() {
		return checkAdmin;
	}

	public void setCheckAdmin(String checkAdmin) {
		this.checkAdmin = checkAdmin;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public PhotoVO getSign() {
		return sign;
	}

	public void setSign(PhotoVO sign) {
		this.sign = sign;
	}

	public PhotoVO getPicture() {
		return picture;
	}

	public void setPicture(PhotoVO picture) {
		this.picture = picture;
	}

	@Override
	public String toString() {
		return "EmployeeCodeViewVO [checkAdmin=" + checkAdmin + ", department=" + department + ", duty=" + duty
				+ ", sign=" + sign + ", picture=" + picture + "]";
	}

	
	
	

}
