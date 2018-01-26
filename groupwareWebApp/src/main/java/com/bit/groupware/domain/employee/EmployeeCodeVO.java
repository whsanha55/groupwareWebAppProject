package com.bit.groupware.domain.employee;

import java.util.List;

public class EmployeeCodeVO {
	private List<CodeVO> codes;
	private List<EmployeeVO> employees;
	
	public EmployeeCodeVO() {
		super();
	}

	public EmployeeCodeVO(List<CodeVO> codes, List<EmployeeVO> employees) {
		super();
		this.codes = codes;
		this.employees = employees;
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
		return "EmployeeCodeVO [codes=" + codes + ", employees=" + employees + "]";
	}

}
