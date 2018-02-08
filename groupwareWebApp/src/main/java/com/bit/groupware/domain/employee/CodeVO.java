package com.bit.groupware.domain.employee;

public class CodeVO {
	private String cNo;
	private String cName;
	private String relationCode;
	private String countRelationCode;
	private String countEmployee;
	private String countApproval;
	private String countApprovalRecord;
	private String countNotification;
	private String countPost;
		
	
	public CodeVO() {
		super();
	}

	public CodeVO(String cNo, String cName, String relationCode) {
		super();
		this.cNo = cNo;
		this.cName = cName;
		this.relationCode = relationCode;
	}

	public String getcNo() {
		return cNo;
	}

	public void setcNo(String cNo) {
		this.cNo = cNo;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getRelationCode() {
		return relationCode;
	}

	public void setRelationCode(String relationCode) {
		this.relationCode = relationCode;
	}
	

	public String getCountRelationCode() {
		return countRelationCode;
	}

	public void setCountRelationCode(String countRelationCode) {
		this.countRelationCode = countRelationCode;
	}

	public String getCountEmployee() {
		return countEmployee;
	}

	public void setCountEmployee(String countEmployee) {
		this.countEmployee = countEmployee;
	}

	public String getCountApproval() {
		return countApproval;
	}

	public void setCountApproval(String countApproval) {
		this.countApproval = countApproval;
	}

	public String getCountApprovalRecord() {
		return countApprovalRecord;
	}

	public void setCountApprovalRecord(String countApprovalRecord) {
		this.countApprovalRecord = countApprovalRecord;
	}

	public String getCountNotification() {
		return countNotification;
	}

	public void setCountNotification(String countNotification) {
		this.countNotification = countNotification;
	}

	public String getCountPost() {
		return countPost;
	}

	public void setCountPost(String countPost) {
		this.countPost = countPost;
	}

	@Override
	public String toString() {
		return "CodeVO [cNo=" + cNo + ", cName=" + cName + ", relationCode=" + relationCode + ", countRelationCode="
				+ countRelationCode + ", countEmployee=" + countEmployee + ", countApproval=" + countApproval
				+ ", countApprovalRecord=" + countApprovalRecord + ", countNotification=" + countNotification
				+ ", countPost=" + countPost + "]";
	}
	

	
	
	

	

	
	
	
	
	

}
