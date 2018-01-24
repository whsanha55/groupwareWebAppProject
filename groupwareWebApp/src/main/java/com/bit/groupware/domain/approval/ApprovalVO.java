package com.bit.groupware.domain.approval;

import java.util.ArrayList;
import java.util.List;

public class ApprovalVO {

	int apprNo;

	String apprDate;
	String validDate;

	int urgency;
	String apprTitle;
	String apprContent;

	int apprFinalStatus;
	EmployeeVO employee;
	TemplateVO template;
	List<ApprovalFileVO> approvalFiles = new ArrayList<ApprovalFileVO>();
	List<ApprovalRecordVO> approvalRecords = new ArrayList<ApprovalRecordVO>();

	public ApprovalVO() {
	}

	public int getApprNo() {
		return apprNo;
	}

	public void setApprNo(int apprNo) {
		this.apprNo = apprNo;
	}

	public String getApprDate() {
		return apprDate;
	}

	public void setApprDate(String apprDate) {
		this.apprDate = apprDate;
	}

	public String getValidDate() {
		return validDate;
	}

	public void setValidDate(String validDate) {
		this.validDate = validDate;
	}

	public int isUrgency() {
		return urgency;
	}

	public String getApprTitle() {
		return apprTitle;
	}

	public void setApprTitle(String apprTitle) {
		this.apprTitle = apprTitle;
	}

	public String getApprContent() {
		return apprContent;
	}

	public void setApprContent(String apprContent) {
		this.apprContent = apprContent;
	}

	public int getApprFinalStatus() {
		return apprFinalStatus;
	}

	public void setApprFinalStatus(int apprFinalStatus) {
		this.apprFinalStatus = apprFinalStatus;
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

	public List<ApprovalFileVO> getApprovalFiles() {
		return approvalFiles;
	}

	public void setApprovalFiles(List<ApprovalFileVO> approvalFiles) {
		this.approvalFiles = approvalFiles;
	}

	public void addApprovalFile(ApprovalFileVO approvalFile) {
		this.approvalFiles.add(approvalFile);
	}

	public List<ApprovalRecordVO> getApprovalRecords() {
		return approvalRecords;
	}

	public void setApprovalRecords(List<ApprovalRecordVO> approvalRecords) {
		this.approvalRecords = approvalRecords;
	}

	public void addApprovalRecord(ApprovalRecordVO approvalRecord) {
		this.approvalRecords.add(approvalRecord);
	}

	public int getUrgency() {
		return urgency;
	}

	public void setUrgency(int urgency) {
		this.urgency = urgency;
	}

	@Override
	public String toString() {
		return "ApprovalVO [apprNo=" + apprNo + ", apprDate=" + apprDate + ", validDate=" + validDate + ", urgency="
				+ urgency + ", apprTitle=" + apprTitle + ", apprContent=" + apprContent + ", apprFinalStatus="
				+ apprFinalStatus + ", employee=" + employee + ", template=" + template + ", approvalFiles="
				+ approvalFiles + ", approvalRecords=" + approvalRecords + "]";
	}

}