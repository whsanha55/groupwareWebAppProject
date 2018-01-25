package com.bit.groupware.domain.employee;

import java.util.List;

public class PlanVO {

	private String pNo;
	private String pTitle;
	private String pClass;
	private String pImpt;
	private String pContent;
	private String startDate;
	private String endDate;
	private int latitude;
	private int longitude;
	private CodeVO code;
	private EmployeeVO employee;
	private List<PlanFileVO> files;
	
	public PlanVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PlanVO(String pNo, String pTitle, String pClass, String pImpt, String pContent, String startDate,
			String endDate, int latitude, int longitude, CodeVO code, EmployeeVO employee, List<PlanFileVO> files) {
		super();
		this.pNo = pNo;
		this.pTitle = pTitle;
		this.pClass = pClass;
		this.pImpt = pImpt;
		this.pContent = pContent;
		this.startDate = startDate;
		this.endDate = endDate;
		this.latitude = latitude;
		this.longitude = longitude;
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

	public String getpImpt() {
		return pImpt;
	}

	public void setpImpt(String pImpt) {
		this.pImpt = pImpt;
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

	public int getLatitude() {
		return latitude;
	}

	public void setLatitude(int latitude) {
		this.latitude = latitude;
	}

	public int getLongitude() {
		return longitude;
	}

	public void setLongitude(int longitude) {
		this.longitude = longitude;
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
		return "PlanVO [pNo=" + pNo + ", pTitle=" + pTitle + ", pClass=" + pClass + ", pImpt=" + pImpt + ", pContent="
				+ pContent + ", startDate=" + startDate + ", endDate=" + endDate + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", code=" + code + ", employee=" + employee + ", files=" + files + "]";
	}
	
	
	
	
	
	
	
}
