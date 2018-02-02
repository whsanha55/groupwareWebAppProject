package com.bit.groupware.domain.authority;

public class AuthRoleVO {
	private String arNo;  			//권한 역할번호
	private AuthorityVO auth; 
	private RoleVO role;
	
	public AuthRoleVO() {
		super();
	}

	public String getArNo() {
		return arNo;
	}

	public void setArNo(String arNo) {
		this.arNo = arNo;
	}

	public AuthorityVO getAuth() {
		return auth;
	}

	public void setAuth(AuthorityVO auth) {
		this.auth = auth;
	}

	public RoleVO getRole() {
		return role;
	}

	public void setRole(RoleVO role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "AuthRoleVO [arNo=" + arNo + ", auth=" + auth + ", role=" + role + "]";
	}

	

	
	
}
