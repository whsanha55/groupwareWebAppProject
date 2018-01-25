package com.bit.groupware.domain.employee;

import java.util.List;

public class PlanVO {

	private String pNo;
	private String pTitle;
	private String pClass;
	private String plmpt;
	private String pContent;
	private String startDate;
	private String endDate;
	private CodeVO code;
	private EmployeeVO employee;
	private List<PlanFileVO> files;
	
	public PlanVO() {
		super();
	}

	public PlanVO(String pNo, String pTitle, String pClass, String plmpt, String pContent, String startDate,
			String endDate, CodeVO code, EmployeeVO employee, List<PlanFileVO> files) {
		super();
		this.pNo = pNo;
		this.pTitle = pTitle;
		this.pClass = pClass;
		this.plmpt = plmpt;
		this.pContent = pContent;
		this.startDate = startDate;
		this.endDate = endDate;
		this.code = code;
		this.employee = employee;
		this.files = files;
	}

	public String getpNo() {
		return pNo;
	}

	public void setpNo(String pNo) {
		this.pNo = pNo;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpClass() {
		return pClass;
	}

	public void setpClass(String pClass) {
		this.pClass = pClass;
	}

	public String getPlmpt() {
		return plmpt;
	}

	public void setPlmpt(String plmpt) {
		this.plmpt = plmpt;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
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

	public List<PlanFileVO> getFiles() {
		return files;
	}

	public void setFiles(List<PlanFileVO> files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "PlanVO [pNo=" + pNo + ", pTitle=" + pTitle + ", pClass=" + pClass + ", plmpt=" + plmpt + ", pContent="
				+ pContent + ", startDate=" + startDate + ", endDate=" + endDate + ", code=" + code + ", files=" + files
				+ "]";
	}
	
	
	
	
}
