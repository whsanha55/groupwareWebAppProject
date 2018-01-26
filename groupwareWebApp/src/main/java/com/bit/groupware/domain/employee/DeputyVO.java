package com.bit.groupware.domain.employee;

import java.util.*;

public class DeputyVO {
	private String depNo;
	private String startDate;
	private String endDate;
	private String progression;
	private String depReason;
	private String dempNo;
	private String empNo;
	
	public DeputyVO() {
		super();
	}

	public DeputyVO(String depNo, String startDate, String endDate, String progression, String depReason, String dempNo,
			String empNo) {
		super();
		this.depNo = depNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.progression = progression;
		this.depReason = depReason;
		this.dempNo = dempNo;
		this.empNo = empNo;
	}

	public String getDepNo() {
		return depNo;
	}

	public void setDepNo(String depNo) {
		this.depNo = depNo;
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

	public String getProgression() {
		return progression;
	}

	public void setProgression(String progression) {
		this.progression = progression;
	}

	public String getDepReason() {
		return depReason;
	}

	public void setDepReason(String depReason) {
		this.depReason = depReason;
	}

	public String getDempNo() {
		return dempNo;
	}

	public void setDempNo(String dempNo) {
		this.dempNo = dempNo;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	@Override
	public String toString() {
		return "DeputyVO [depNo=" + depNo + ", startDate=" + startDate + ", endDate=" + endDate + ", progression="
				+ progression + ", depReason=" + depReason + ", dempNo=" + dempNo + ", empNo=" + empNo + "]";
	}

	
}
