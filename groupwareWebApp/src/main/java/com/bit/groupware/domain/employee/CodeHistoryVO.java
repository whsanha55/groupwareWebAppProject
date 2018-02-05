package com.bit.groupware.domain.employee;

public class CodeHistoryVO {
	private int no;
	private String empNo;
	private String startDate;
	private String endDate;
	private String deptNo;
	private String dutyNo;
	private String empName;
	private String deptName;
	private String dutyName;
	
	public CodeHistoryVO() {
		super();
	}

	public CodeHistoryVO(int no, String empNo, String startDate, String endDate, String deptNo, String dutyNo) {
		super();
		this.no = no;
		this.empNo = empNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.deptNo = deptNo;
		this.dutyNo = dutyNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}

	public String getDutyNo() {
		return dutyNo;
	}

	public void setDutyNo(String dutyNo) {
		this.dutyNo = dutyNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDutyName() {
		return dutyName;
	}

	public void setDutyName(String dutyName) {
		this.dutyName = dutyName;
	}

	@Override
	public String toString() {
		return "CodeHistoryVO [no=" + no + ", empNo=" + empNo + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", deptNo=" + deptNo + ", dutyNo=" + dutyNo + ", empName=" + empName + ", deptName=" + deptName
				+ ", dutyName=" + dutyName + "]";
	}
	
	
	
	
	
	
	
}
