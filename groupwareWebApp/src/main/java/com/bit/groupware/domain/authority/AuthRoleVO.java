package com.bit.groupware.domain.authority;

public class AuthRoleVO {
	private int arNo;  			//���� ���� ��ȣ
	private String rId; 				//�� ���̵�
	private String aNo; 			//���� ��ȣ
	
	public AuthRoleVO() {
		super();
	}

	public int getArNo() {
		return arNo;
	}

	public void setArNo(int arNo) {
		this.arNo = arNo;
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
