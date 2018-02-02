package com.bit.groupware.domain.employee;


public class EmployeeCodeVO {
	private String empNo;
	private String cNo;

	public EmployeeCodeVO() {
		super();
	}

	public EmployeeCodeVO(String cNo) {
		this.cNo = cNo;
	}
	
	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getcNo() {
		return cNo;
	}

	public void setcNo(String cNo) {
		this.cNo = cNo;
	}

}
