package com.bit.groupware.domain.approval;

import com.bit.groupware.domain.employee.EmployeeVO;

public class TemplateBookmarkVO {

	int bookmarkNo;
	EmployeeVO employee;
	TemplateVO template;

	public TemplateBookmarkVO() {
	}

	public int getBookmarkNo() {
		return bookmarkNo;
	}

	public void setBookmarkNo(int bookmarkNo) {
		this.bookmarkNo = bookmarkNo;
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

}
