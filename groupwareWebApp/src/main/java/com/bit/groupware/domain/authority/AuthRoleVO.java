package com.bit.groupware.domain.authority;

public class AuthRoleVO {
	private int arNo;  			//권한 역할번호
	private String rId; 
	private String aNo;
	
	public AuthRoleVO() {
		super();
	}

	public int getArNo() {
		return arNo;
	}

	public String getrId() {
		return rId;
	}

	public void setrId(String rId) {
		this.rId = rId;
	}

	public String getaNo() {
		return aNo;
	}

	public void setaNo(String aNo) {
		this.aNo = aNo;
	}

	@Override
	public String toString() {
		return "AuthRoleVO [arNo=" + arNo + ", rId=" + rId + ", aNo=" + aNo + "]";
	}

	

	
	
}
