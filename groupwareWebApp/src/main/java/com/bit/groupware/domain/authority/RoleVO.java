package com.bit.groupware.domain.authority;

import java.util.ArrayList;
import java.util.List;

public class RoleVO {
	private String rId;  			//�� ���̵�
	private String rName; 		//�Ѹ�
	private String rType; 			//�� Ÿ��
	private String rExplan; 		//�� ����
	private String rDate;			 // ��� ���� 
	private String isRegistration; //��� ����
	private int sortOrder; 			//���� ����
	
	 private List<AuthorityVO> authorities = new ArrayList<AuthorityVO>();
	 
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

	public int getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}

	public List<AuthorityVO> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(List<AuthorityVO> authorities) {
		this.authorities = authorities;
	}

	@Override
	public String toString() {
		return "RoleVO [rId=" + rId + ", rName=" + rName + ", rType=" + rType + ", rExplan=" + rExplan + ", rDate="
				+ rDate + ", isRegistration=" + isRegistration + ", sortOrder=" + sortOrder + ", authorities="
				+ authorities + "]";
	}
	
}
