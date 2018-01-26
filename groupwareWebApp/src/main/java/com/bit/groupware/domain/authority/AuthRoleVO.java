package com.bit.groupware.domain.authority;

import java.util.ArrayList;
import java.util.List;

public class AuthRoleVO {
	private int arNo;  			//권한 역할 번호
	private String rId; 				//롤 아이디
	private String aNo; 			//권한 번호
	
	List<RoleVO> roles = new ArrayList<RoleVO>();
	List<AuthorityVO> authorities = new ArrayList<AuthorityVO>();
	
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
	
	

	public List<RoleVO> getRoles() {
		return roles;
	}

	public void setRoles(List<RoleVO> roles) {
		this.roles = roles;
	}

	

	public List<AuthorityVO> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(List<AuthorityVO> authorities) {
		this.authorities = authorities;
	}

	@Override
	public String toString() {
		return "AuthRoleVO [arNo=" + arNo + ", rId=" + rId + ", aNo=" + aNo + ", roles=" + roles + ", authorities="
				+ authorities + "]";
	}

	
	
	
}
