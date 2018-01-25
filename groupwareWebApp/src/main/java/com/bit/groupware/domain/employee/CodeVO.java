package com.bit.groupware.domain.employee;

public class CodeVO {
	private String cNo;
	private String cName;
	private String relationCode;
	
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

	@Override
	public String toString() {
		return "CodeVO [cNo=" + cNo + ", cName=" + cName + ", relationCode=" + relationCode + "]";
	}
	
	
	
	

}
