package com.bit.groupware.domain.employee;

public class EmployeeCodeVO {
	private String empNo;
	private String cNo;
	private EmployeeVO employee;
	private CodeVO code;

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

	public EmployeeVO getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeVO employee) {
		this.employee = employee;
	}

	public CodeVO getCode() {
		return code;
	}

	public void setCode(CodeVO code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "EmployeeCodeVO [empNo=" + empNo + ", cNo=" + cNo + ", employee=" + employee + ", code=" + code + "]";
	}

}
