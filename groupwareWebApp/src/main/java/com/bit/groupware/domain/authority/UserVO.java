package com.bit.groupware.domain.authority;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.bit.groupware.domain.employee.CodeVO;
import com.bit.groupware.domain.employee.PhotoVO;

public class UserVO extends User {

	private String photoName;
	private String isAdmin;
	private String deptName; //�μ���
	private String jobName; //���޸�
	private String empName; //��� �̸�
	

	public UserVO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);

	}


	public String getPhotoName() {
		return photoName;
	}


	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}


	public String getIsAdmin() {
		return isAdmin;
	}


	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}


	public String getDeptName() {
		return deptName;
	}


	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}


	public String getJobName() {
		return jobName;
	}


	public void setJobName(String jobName) {
		this.jobName = jobName;
	}


	
	
	public String getEmpName() {
		return empName;
	}


	public void setEmpName(String empName) {
		this.empName = empName;
	}


	@Override
	public String toString() {
		return "UserVO [photoName=" + photoName + ", isAdmin=" + isAdmin + ", deptName=" + deptName + ", jobName="
				+ jobName + ", empName=" + empName + "]";
	}


	
	
	
}
