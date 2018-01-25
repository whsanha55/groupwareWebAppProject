package com.bit.groupware.domain.authority;

public class DocumentVO {
	private String documentNo;  		//문서 종류 번호
	private String documentName; 		//문서명
	
	public DocumentVO() {
		super();
	}

	public String getDocumentNo() {
		return documentNo;
	}

	public void setDocumentNo(String documentNo) {
		this.documentNo = documentNo;
	}

	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	@Override
	public String toString() {
		return "DocumentVO [documentNo=" + documentNo + ", documentName=" + documentName + "]";
	}
}
