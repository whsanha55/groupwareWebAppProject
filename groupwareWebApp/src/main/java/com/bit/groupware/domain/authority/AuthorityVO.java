package com.bit.groupware.domain.authority;

import java.util.ArrayList;
import java.util.List;

import com.bit.groupware.domain.employee.EmployeeVO;

public class AuthorityVO {
	private String aNo;  			//권한 번호
	private String aName;			//권한명
	private String aNote; 			//비고
	private String aWhether; 		//유무
	private List<EmployeeVO> emp = new ArrayList<EmployeeVO>();
	private List<AuthEmpVO> authemps = new ArrayList<AuthEmpVO>();
	private List<AuthRoleVO> authRoles = new ArrayList<AuthRoleVO>();
	
	public AuthorityVO() {
		super();
	}
	public String getaNo() {
		return aNo;
	}
	public void setaNo(String aNo) {
		this.aNo = aNo;
	}
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
	}
	public String getaNote() {
		return aNote;
	}
	public void setaNote(String aNote) {
		this.aNote = aNote;
	}
	public String getaWhether() {
		return aWhether;
	}
	public void setaWhether(String aWhether) {
		this.aWhether = aWhether;
	}

	public List<AuthEmpVO> getAuthemps() {
		return authemps;
	}
	public void setAuthemps(List<AuthEmpVO> authemps) {
		this.authemps = authemps;
	}
	
	
	public List<AuthRoleVO> getAuthRoles() {
		return authRoles;
	}
	public void setAuthRoles(List<AuthRoleVO> authRoles) {
		this.authRoles = authRoles;
	}
	
	
	public List<EmployeeVO> getEmp() {
		return emp;
	}
	public void setEmp(List<EmployeeVO> emp) {
		this.emp = emp;
	}
	@Override
	public String toString() {
		return "AuthorityVO [aNo=" + aNo + ", aName=" + aName + ", aNote=" + aNote + ", aWhether=" + aWhether + ", emp="
				+ emp + ", authemps=" + authemps + ", authRoles=" + authRoles + "]";
	}
	
	
	
	
}
