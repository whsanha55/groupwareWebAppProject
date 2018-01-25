package com.bit.groupware.domain.authority;

import java.util.ArrayList;
import java.util.List;

import com.bit.groupware.domain.employee.EmployeeVO;

public class AuthorityVO {
	private String aNo;  			//권한 번호
	private String aName;			//권한명
	private String aNote; 			//비고
	private String aWhether; 		//유무
	private List<EmployeeVO> emps = new ArrayList<EmployeeVO>(); //사원 목록
	private List<RoleVO> roles = new ArrayList<RoleVO>(); 				//역할 목록
	
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
	public List<EmployeeVO> getEmps() {
		return emps;
	}
	public void setEmps(List<EmployeeVO> emps) {
		this.emps = emps;
	}
	public List<RoleVO> getRoles() {
		return roles;
	}
	public void setRoles(List<RoleVO> roles) {
		this.roles = roles;
	}
	
	public void addRole(RoleVO role) {
		roles.add(role);
	}
	
	@Override
	public String toString() {
		return "AuthorityVO [aNo=" + aNo + ", aName=" + aName + ", aNote=" + aNote + ", aWhether=" + aWhether
				+ ", emps=" + emps + ", roles=" + roles + "]";
	}
}
