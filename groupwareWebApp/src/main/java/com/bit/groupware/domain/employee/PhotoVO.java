package com.bit.groupware.domain.employee;

public class PhotoVO {
	private String photoNo;
	private String photoName;
	private String systemFileName;
	private long fileSize;
	private String division;
	private String empNo;
	
	public PhotoVO() {
		super();
	}

	public PhotoVO(String photoNo, String photoName, String systemFileName, long fileSize, String division,
			String empNo) {
		super();
		this.photoNo = photoNo;
		this.photoName = photoName;
		this.systemFileName = systemFileName;
		this.fileSize = fileSize;
		this.division = division;
		this.empNo = empNo;
	}

	public String getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(String photoNo) {
		this.photoNo = photoNo;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getSystemFileName() {
		return systemFileName;
	}

	public void setSystemFileName(String systemFileName) {
		this.systemFileName = systemFileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	
	@Override
	public String toString() {
		return "PhotoVO [photoNo=" + photoNo + ", photoName=" + photoName + ", systemFileName=" + systemFileName
				+ ", fileSize=" + fileSize + ", division=" + division + ", empNo=" + empNo + "]";
	}
	
}
