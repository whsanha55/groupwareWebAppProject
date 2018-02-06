package com.bit.groupware.domain.approval;

import com.bit.groupware.domain.employee.CodeVO;

public class DelegationVO {

	private int deleNo;
	private String deleDate;
	private TemplateVO template;
	private CodeVO duty;
	
	
	public DelegationVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getDeleNo() {
		return deleNo;
	}
	public void setDeleNo(int deleNo) {
		this.deleNo = deleNo;
	}
	public String getDeleDate() {
		return deleDate;
	}
	public void setDeleDate(String deleDate) {
		this.deleDate = deleDate;
	}
	public TemplateVO getTemplate() {
		return template;
	}
	public void setTemplate(TemplateVO template) {
		this.template = template;
	}
	public CodeVO getCode() {
		return duty;
	}
	public void setCode(CodeVO code) {
		this.duty = code;
	}
	@Override
	public String toString() {
		return "DelegationVO [deleNo=" + deleNo + ", deleDate=" + deleDate + ", template=" + template + ", code=" + duty
				+ "]";
	}

	
}
