package com.bit.groupware.domain.employee;

public class PlanFileVO {

	private String fileNo;
	private String fileName;
	private String systemFileName;
	private long fileSize;
	private String pNo;
	
	public PlanFileVO() {
		super();
	}

	public PlanFileVO(String fileNo, String fileName, String systemFileName, int fileSize, String pNo) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.systemFileName = systemFileName;
		this.fileSize = fileSize;
		this.pNo = pNo;
	}

	public String getFileNo() {
		return fileNo;
	}

	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
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

	public String getpNo() {
		return pNo;
	}

	public void setpNo(String pNo) {
		this.pNo = pNo;
	}

	@Override
	public String toString() {
		return "PlanFileVO [fileNo=" + fileNo + ", fileName=" + fileName + ", systemFileName=" + systemFileName
				+ ", fileSize=" + fileSize + ", pNo=" + pNo + "]";
	}
	
	
	
	
}
