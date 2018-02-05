package com.bit.groupware.domain.employee;

public class EmployeeCodeViewVO {
	
	private String checkAdmin;
	private String department;
	private String duty;
	private PhotoVO sign;
	private String systemSignName;
	private PhotoVO photo;
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

	public PhotoVO getSign() {
		return sign;
	}

	public void setSign(PhotoVO sign) {
		this.sign = sign;
	}

	public String getSystemSignName() {
		return systemSignName;
	}

	public void setSystemSignName(String systemSignName) {
		this.systemSignName = systemSignName;
	}

	public PhotoVO getPhoto() {
		return photo;
	}

	public void setPhoto(PhotoVO photo) {
		this.photo = photo;
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

	@Override
	public String toString() {
		return "EmployeeCodeViewVO [checkAdmin=" + checkAdmin + ", department=" + department + ", duty=" + duty
				+ ", sign=" + sign + ", systemSignName=" + systemSignName + ", photo=" + photo + ", systemPhotoName="
				+ systemPhotoName + ", deptNo=" + deptNo + ", dutyNo=" + dutyNo + "]";
	}
	

}
