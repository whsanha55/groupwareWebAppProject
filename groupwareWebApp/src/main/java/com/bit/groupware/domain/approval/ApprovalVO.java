package com.bit.groupware.domain.approval;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;


import com.bit.groupware.domain.employee.EmployeeVO;


public class ApprovalVO {

	private int apprNo;
	private String apprDate;
	private String validDate;
	private int urgency;
	private String apprTitle;
	private String apprContent;
	//0->진행중, 1->결재, 2->보류, 3->반려, 4->임시보관, 5->회수
	private int apprFinalStatus;
	private String completeDate;
	private int receiverNo;
	private EmployeeVO employee;
	private TemplateVO template;
	private List<MultipartFile> upload;
	private List<ApprovalFileVO> approvalFiles = new ArrayList<ApprovalFileVO>();
	private List<ApprovalRecordVO> approvalRecords = new ArrayList<ApprovalRecordVO>();

	public ApprovalVO() {
	}

	public int getReceiverNo() {
		return receiverNo;
	}

	public void setReceiverNo(int receiverNo) {
		this.receiverNo = receiverNo;
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
	
	
	public List<MultipartFile> getUpload() {
		return upload;
	}

	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
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

	public String getCompleteDate() {
		return completeDate;
	}

	public void setCompleteDate(String completeDate) {
		this.completeDate = completeDate;
	}

	@Override
	public String toString() {
		return "ApprovalVO [apprNo=" + apprNo + ", apprDate=" + apprDate + ", validDate=" + validDate + ", urgency="
				+ urgency + ", apprTitle=" + apprTitle + ", apprContent=" + apprContent + ", apprFinalStatus="
				+ apprFinalStatus + ", completeDate=" + completeDate + ", receiverNo=" + receiverNo + ", employee="
				+ employee + ", template=" + template + ", upload=" + upload + ", approvalFiles=" + approvalFiles
				+ ", approvalRecords=" + approvalRecords + "]";
	}

	
	

}
