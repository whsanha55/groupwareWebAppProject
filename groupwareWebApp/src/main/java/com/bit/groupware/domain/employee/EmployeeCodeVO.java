package com.bit.groupware.domain.employee;

import java.util.List;

public class EmployeeCodeVO {
	private CodeVO code;
	private EmployeeVO employee;
	private List<CodeVO> codes;
	private List<EmployeeVO> employees;
	
	public EmployeeCodeVO() {
		super();
	}

	public EmployeeCodeVO(CodeVO code, EmployeeVO employee, List<CodeVO> codes, List<EmployeeVO> employees) {
		super();
		this.code = code;
		this.employee = employee;
		this.codes = codes;
		this.employees = employees;
	}

	public CodeVO getCode() {
		return code;
	}

	public void setCode(CodeVO code) {
		this.code = code;
	}

	public EmployeeVO getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeVO employee) {
		this.employee = employee;
	}

	public List<CodeVO> getCodes() {
		return codes;
	}

	public void setCodes(List<CodeVO> codes) {
		this.codes = codes;
	}

	public List<EmployeeVO> getEmployees() {
		return employees;
	}

	public void setEmployees(List<EmployeeVO> employees) {
		this.employees = employees;
	}

	@Override
	public String toString() {
		return "EmployeeCodeVO [code=" + code + ", employee=" + employee + ", codes=" + codes + ", employees="
				+ employees + "]";
	}

}
