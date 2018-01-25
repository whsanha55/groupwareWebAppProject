package com.bit.groupware.domain.employee;

public class EmployeeVO {
	private String empNo;
	private String empName;
	private String empPwd;
	private String engName;
	private String phoneNumber;
	private String email;
	private String regNumber;
	private String hireDate;
	private String retireStatus;
	private String retireDate;
	private String address;

	public EmployeeVO() {
		super();
	}

	public EmployeeVO(String empNo, String empName, String empPwd, String engName, String phoneNumber, String email,
			String regNumber, String hireDate, String retireStatus, String retireDate, String address) {
		super();
		this.empNo = empNo;
		this.empName = empName;
		this.empPwd = empPwd;
		this.engName = engName;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.regNumber = regNumber;
		this.hireDate = hireDate;
		this.retireStatus = retireStatus;
		this.retireDate = retireDate;
		this.address = address;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpPwd() {
		return empPwd;
	}

	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}

	public String getEngName() {
		return engName;
	}

	public void setEngName(String engName) {
		this.engName = engName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegNumber() {
		return regNumber;
	}

	public void setRegNumber(String regNumber) {
		this.regNumber = regNumber;
	}

	public String getHireDate() {
		return hireDate;
	}

	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	public String getRetireStatus() {
		return retireStatus;
	}

	public void setRetireStatus(String retireStatus) {
		this.retireStatus = retireStatus;
	}

	public String getRetireDate() {
		return retireDate;
	}

	public void setRetireDate(String retireDate) {
		this.retireDate = retireDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "EmployeeVO [empNo=" + empNo + ", empName=" + empName + ", empPwd=" + empPwd + ", engName=" + engName
				+ ", phoneNumber=" + phoneNumber + ", email=" + email + ", regNumber=" + regNumber + ", hireDate="
				+ hireDate + ", retireStatus=" + retireStatus + ", retireDate=" + retireDate + ", address=" + address
				+ "]";
	}

}