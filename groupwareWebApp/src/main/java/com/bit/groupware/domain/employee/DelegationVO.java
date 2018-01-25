package com.bit.groupware.domain.employee;

import com.bit.groupware.domain.approval.TemplateVO;

public class DelegationVO {

	int dele_no;
	EmployeeVO employee;
	TemplateVO template;
	EmployeeVO deleEmployee;

	public DelegationVO() {
		super();
	}

	public int getDele_no() {
		return dele_no;
	}

	public void setDele_no(int dele_no) {
		this.dele_no = dele_no;
	}

	public EmployeeVO getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeVO employee) {
		this.employee = employee;
	}

	public TemplateVO getTemplate() {
		return template;
	}

	public void setTemplate(TemplateVO template) {
		this.template = template;
	}

	public EmployeeVO getDeleEmployee() {
		return deleEmployee;
	}

	public void setDeleEmployee(EmployeeVO deleEmployee) {
		this.deleEmployee = deleEmployee;
	}

}
