package com.bit.groupware.domain.authority;

public class DocumentVO {
	private String documentNo;  		//���� ���� ��ȣ
	private String documentName; 		//������
	
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
