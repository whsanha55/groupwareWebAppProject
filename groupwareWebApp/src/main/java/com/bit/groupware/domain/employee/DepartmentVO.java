package com.bit.groupware.domain.employee;

public class DepartmentVO extends CodeVO {
	private String headDept;
	private String phoneNumber;
	private int memberCount;
	private	int teamCount;
	
	public DepartmentVO() {
		super();
	}

	public DepartmentVO(String headDept, String phoneNumber) {
		super();
		this.headDept = headDept;
		this.phoneNumber = phoneNumber;
	}

	public DepartmentVO(String headDept, String phoneNumber, int memberCount, int teamCount) {
		super();
		this.headDept = headDept;
		this.phoneNumber = phoneNumber;
		this.memberCount = memberCount;
		this.teamCount = teamCount;
	}

	public String getHeadDept() {
		return headDept;
	}

	public void setHeadDept(String headDept) {
		this.headDept = headDept;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}

	public int getTeamCount() {
		return teamCount;
	}

	public void setTeamCount(int teamCount) {
		this.teamCount = teamCount;
	}

	@Override
	public String toString() {
		return "DepartmentVO [headDept=" + headDept + ", phoneNumber=" + phoneNumber + ", memberCount=" + memberCount
				+ ", teamCount=" + teamCount + "]";
	}

	
	
}
