package com.bit.groupware.domain.employee;

public class EmployeeCodeVO {
	private String cNo;
	private String empNo;
	
	public EmployeeCodeVO() {
		super();
	}
	
	public EmployeeCodeVO(String cNo, String empNo) {
		super();
		this.cNo = cNo;
		this.empNo = empNo;
	}

	public String getcNo() {
		return cNo;
	}

	public void setcNo(String cNo) {
		this.cNo = cNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	@Override
	public String toString() {
		return "EmployeeCodeVO [cNo=" + cNo + ", empNo=" + empNo + "]";
	}

}
