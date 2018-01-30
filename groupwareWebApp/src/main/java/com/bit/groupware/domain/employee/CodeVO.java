package com.bit.groupware.domain.employee;

public class CodeVO {
	private String cNo;
	private String cName;
	private String relationCode;
	private String countRelationCode;
	private String countEmployee;
	
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

	@Override
	public String toString() {
		return "CodeVO [cNo=" + cNo + ", cName=" + cName + ", relationCode=" + relationCode + ", countRelationCode="
				+ countRelationCode + ", countEmployee=" + countEmployee + "]";
	}

	

	
	
	
	
	

}
