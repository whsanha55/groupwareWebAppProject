package com.bit.groupware.domain.authority;

import java.util.ArrayList;
import java.util.List;

import com.bit.groupware.domain.employee.EmployeeVO;

public class AuthEmpVO {
	private String aNo;  			//���� ��ȣ
	private String aName; 		//���Ѹ�
	private List<EmployeeVO> emps = new ArrayList<EmployeeVO>(); //��� ���
	
	
	public AuthEmpVO() {
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

	public List<EmployeeVO> getEmps() {
		return emps;
	}

	public void setEmps(List<EmployeeVO> emps) {
		this.emps = emps;
	}

	@Override
	public String toString() {
		return "AuthEmpVO [aNo=" + aNo + ", aName=" + aName + ", emps=" + emps + "]";
	}
	
}
