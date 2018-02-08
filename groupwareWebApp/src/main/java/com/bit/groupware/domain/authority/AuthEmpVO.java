package com.bit.groupware.domain.authority;

import com.bit.groupware.domain.employee.EmployeeVO;

public class AuthEmpVO {
	private String aeNo;  			//권한사원 번호
	private String aNo;
	private String empNo;
	
	
	
	public AuthEmpVO() {
		super();
	}
	public String getAeNo() {
		return aeNo;
	}
	public void setAeNo(String aeNo) {
		this.aeNo = aeNo;
	}
	public String getaNo() {
		return aNo;
	}
	public void setaNo(String aNo) {
		this.aNo = aNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	@Override
	public String toString() {
		return "AuthEmpVO [aeNo=" + aeNo + ", aNo=" + aNo + ", empNo=" + empNo + "]";
	}
	
	
	
	
	
	
	
	
}
