package com.bit.groupware.domain.authority;

import com.bit.groupware.domain.employee.EmployeeVO;

public class AuthEmpVO {
	private String aeNo;  			//���ѻ�� ��ȣ
	private EmployeeVO emp;
	private AuthorityVO auth;
	
	public String getAeNo() {
		return aeNo;
	}
	public void setAeNo(String aeNo) {
		this.aeNo = aeNo;
	}
	public EmployeeVO getEmp() {
		return emp;
	}
	public void setEmp(EmployeeVO emp) {
		this.emp = emp;
	}
	public AuthorityVO getAuth() {
		return auth;
	}
	public void setAuth(AuthorityVO auth) {
		this.auth = auth;
	}
	@Override
	public String toString() {
		return "AuthEmpVO [aeNo=" + aeNo + ", emp=" + emp + ", auth=" + auth + "]";
	}
	
	
	
	
	
	
}
