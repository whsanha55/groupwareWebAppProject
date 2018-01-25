package com.bit.groupware.service.authority;

public interface LoginService {
	
	//관리자 여부를 체크한다.
	boolean loginAdmin(String adminId, String adminPwd);
	
	//사원 여부를 체크한다.
	boolean loginEmployee(String empNo, String empPwd);

}
