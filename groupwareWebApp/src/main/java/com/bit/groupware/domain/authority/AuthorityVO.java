package com.bit.groupware.domain.authority;

import java.util.ArrayList;
import java.util.List;

import com.bit.groupware.domain.employee.EmployeeVO;

public class AuthorityVO {
	private String aNo;  			//���� ��ȣ
	private String aName;			//���Ѹ�
	private String aNote; 			//���
	private String aWhether; 		//����
	private List<EmployeeVO> emps = new ArrayList<EmployeeVO>(); //��� ���
	
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
	@Override
	public String toString() {
		return "AuthorityVO [aNo=" + aNo + ", aName=" + aName + ", aNote=" + aNote + ", aWhether=" + aWhether
				+ ", emps=" + emps + "]";
	}


}
