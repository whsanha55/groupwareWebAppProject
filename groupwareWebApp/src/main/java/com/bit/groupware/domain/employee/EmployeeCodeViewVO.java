package com.bit.groupware.domain.employee;

public class EmployeeCodeViewVO {
	
	private String checkAdmin;
	private String department;
	private String duty;
	private String signName;
	private String systemSignName;
	private String photoName;
	private String systemPhotoName;
	private String deptNo;
	private String dutyNo;
	
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

	

	public String getSystemSignName() {
		return systemSignName;
	}

	public void setSystemSignName(String systemSignName) {
		this.systemSignName = systemSignName;
	}

	public String getSystemPhotoName() {
		return systemPhotoName;
	}

	public void setSystemPhotoName(String systemPhotoName) {
		this.systemPhotoName = systemPhotoName;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	public String getDutyNo() {
		return dutyNo;
	}

	public void setDutyNo(String dutyNo) {
		this.dutyNo = dutyNo;
	}
	
	public String getSignName() {
		return signName;
	}

	public void setSignName(String signName) {
		this.signName = signName;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	@Override
	public String toString() {
		return "EmployeeCodeViewVO [checkAdmin=" + checkAdmin + ", department=" + department + ", duty=" + duty
				+ ", signName=" + signName + ", systemSignName=" + systemSignName + ", photoName=" + photoName
				+ ", systemPhotoName=" + systemPhotoName + ", deptNo=" + deptNo + ", dutyNo=" + dutyNo + "]";
	}

}
