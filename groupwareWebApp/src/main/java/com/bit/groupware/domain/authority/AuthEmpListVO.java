package com.bit.groupware.domain.authority;

public class AuthEmpListVO {

	private String empNo ;
	private String empName;
	private String department;
	private String duty;

	public AuthEmpListVO() {
		super();
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
	@Override
	public String toString() {
		return "AuthEmpListVO [empNo=" + empNo + ", empName=" + empName + ", department=" + department + ", duty="
				+ duty + "]";
	}
	
	
	
	
}
