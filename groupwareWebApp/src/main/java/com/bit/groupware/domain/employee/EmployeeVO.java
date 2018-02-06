package com.bit.groupware.domain.employee;

import java.util.*;

import org.springframework.web.multipart.MultipartFile;

public class EmployeeVO extends EmployeeCodeViewVO{
	private String empNo;
	private String empName;
	private String empPwd;
	private String engName;
	private String phoneNumber;
	private String email;
	private String regNumber;
	private String hireDate;
	private String retireStatus;
	private String retireDate;
	private String postcode;
	private String address;
	private String detailAddress;
	private String isAdmin;	
	private List<MultipartFile> upload;
	private List<CodeVO> codes;
	private List<EmployeeCodeVO> codeList;
	private List<PhotoVO> photos = new ArrayList<PhotoVO>();
	

	public EmployeeVO() {
		super();
	}

	
	public EmployeeVO(String empNo, String empName, String empPwd, String engName, String phoneNumber, String email,
			String regNumber, String hireDate, String retireStatus, String retireDate, String postcode, String address,
			String detailAddress, String isAdmin, List<MultipartFile> upload, List<CodeVO> codes,
			List<EmployeeCodeVO> codeList, List<PhotoVO> photos) {
		super();
		this.empNo = empNo;
		this.empName = empName;
		this.empPwd = empPwd;
		this.engName = engName;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.regNumber = regNumber;
		this.hireDate = hireDate;
		this.retireStatus = retireStatus;
		this.retireDate = retireDate;
		this.postcode = postcode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.isAdmin = isAdmin;
		this.upload = upload;
		this.codes = codes;
		this.codeList = codeList;
		this.photos = photos;
	}


	public List<EmployeeCodeVO> getCodeList() {
		return codeList;
	}

	public void setCodeList(List<EmployeeCodeVO> codeList) {
		this.codeList = codeList;
	}

	public List<MultipartFile> getUpload() {
		return upload;
	}

	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpPwd() {
		return empPwd;
	}

	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}

	public String getEngName() {
		return engName;
	}

	public void setEngName(String engName) {
		this.engName = engName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegNumber() {
		return regNumber;
	}

	public void setRegNumber(String regNumber) {
		this.regNumber = regNumber;
	}

	public String getHireDate() {
		return hireDate;
	}

	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	public String getRetireStatus() {
		return retireStatus;
	}

	public void setRetireStatus(String retireStatus) {
		this.retireStatus = retireStatus;
	}

	public String getRetireDate() {
		return retireDate;
	}

	public void setRetireDate(String retireDate) {
		this.retireDate = retireDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<CodeVO> getCodes() {
		return codes;
	}

	public void setCodes(List<CodeVO> codes) {
		this.codes = codes;
	}

	public List<PhotoVO> getPhotos() {
		return photos;
	}

	public void setPhotos(List<PhotoVO> photos) {
		this.photos = photos;
	}

	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

	public void addPhoto(PhotoVO photo) {
		photos.add(photo);
	}

	public void addCode(CodeVO code) {
		codes.add(code);
	}

	public String getPostcode() {
		return postcode;
	}


	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}


	public String getDetailAddress() {
		return detailAddress;
	}


	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}


	@Override
	public String toString() {
		return "EmployeeVO [empNo=" + empNo + ", empName=" + empName + ", empPwd=" + empPwd + ", engName=" + engName
				+ ", phoneNumber=" + phoneNumber + ", email=" + email + ", regNumber=" + regNumber + ", hireDate="
				+ hireDate + ", retireStatus=" + retireStatus + ", retireDate=" + retireDate + ", postcode=" + postcode
				+ ", address=" + address + ", detailAddress=" + detailAddress + ", isAdmin=" + isAdmin + ", upload="
				+ upload + ", codes=" + codes + ", codeList=" + codeList + ", photos=" + photos + "]";
	}


}
