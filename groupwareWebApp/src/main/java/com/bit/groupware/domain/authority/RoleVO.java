package com.bit.groupware.domain.authority;

public class RoleVO {
	private String rId;  			//�� ���̵�
	private String rName; 		//�Ѹ�
	private String rType; 			//�� Ÿ��
	private String rExplan; 		//�� ����
	private String rDate;			 // ��� ���� 
	private String isRegistration; //��� ����
	
	public RoleVO() {
		super();
	}
	public String getrId() {
		return rId;
	}
	public void setrId(String rId) {
		this.rId = rId;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getrType() {
		return rType;
	}
	public void setrType(String rType) {
		this.rType = rType;
	}
	public String getrExplan() {
		return rExplan;
	}
	public void setrExplan(String rExplan) {
		this.rExplan = rExplan;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public String getIsRegistration() {
		return isRegistration;
	}
	public void setIsRegistration(String isRegistration) {
		this.isRegistration = isRegistration;
	}
	@Override
	public String toString() {
		return "RoleVO [rId=" + rId + ", rName=" + rName + ", rType=" + rType + ", rExplan=" + rExplan + ", rDate="
				+ rDate + ", isRegistration=" + isRegistration + "]";
	}
}
