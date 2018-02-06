package com.bit.groupware.domain.authority;

public class CmtVO {

	private int cmtNo;
    private int postNo;
    private String cmtContent;
    private String cmtWriter;
    private String cmtDate;
    
	public int getCmtNo() {
		return cmtNo;
	}
	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}	
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getCmtContent() {
		return cmtContent;
	}
	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
	public String getCmtWriter() {
		return cmtWriter;
	}
	public void setCmtWriter(String cmtWriter) {
		this.cmtWriter = cmtWriter;
	}
	public String getCmtDate() {
		return cmtDate;
	}
	public void setCmtDate(String cmtDate) {
		this.cmtDate = cmtDate;
	}
	
	@Override
	public String toString() {
		return "CmtVO [cmtNo=" + cmtNo + ", postNo=" + postNo + ", cmtContent=" + cmtContent + ", cmtWriter="
				+ cmtWriter + ", cmtDate=" + cmtDate + "]";
	}
	
	
    
	
    
    
 
    
}
