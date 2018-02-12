package com.bit.groupware.domain.employee;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PlanVO {

	private String pNo;
	private String pTitle;
	private String deptNo;
	private int pClass;
	private int pImpt;
	private String rspbNo;
	private String pContent;
	private String startDate;
	private String endDate;
	private String destination;
	private double latitude;
	private double longitude;
	private List<CodeVO> codes;
	private EmployeeVO employee;
	private List<MultipartFile> upload;
	private List<PlanFileVO> files = new ArrayList<PlanFileVO>();
	
	private String cName;
	private String empName;
	
	public PlanVO() {
		super();
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

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	public int getpClass() {
		return pClass;
	}

	public void setpClass(int pClass) {
		this.pClass = pClass;
	}

	public int getpImpt() {
		return pImpt;
	}

	public void setpImpt(int pImpt) {
		this.pImpt = pImpt;
	}

	public String getRspbNo() {
		return rspbNo;
	}

	public void setRspbNo(String rspbNo) {
		this.rspbNo = rspbNo;
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

	public List<MultipartFile> getUpload() {
		return upload;
	}

	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
	
	public void addPlanFile(PlanFileVO file) {
		files.add(file);
	}

	public List<PlanFileVO> getFiles() {
		return files;
	}

	public void setFiles(List<PlanFileVO> files) {
		this.files = files;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	@Override
	public String toString() {
		return "PlanVO [pNo=" + pNo + ", pTitle=" + pTitle + ", deptNo=" + deptNo + ", pClass=" + pClass + ", pImpt="
				+ pImpt + ", rspbNo=" + rspbNo + ", pContent=" + pContent + ", startDate=" + startDate + ", endDate="
				+ endDate + ", destination=" + destination + ", latitude=" + latitude + ", longitude=" + longitude
				+ ", codes=" + codes + ", employee=" + employee + ", upload=" + upload + ", files=" + files + ", cName="
				+ cName + ", empName=" + empName + "]";
	}

	

	
	
	
}
