package com.bit.groupware.service.authority;

public interface LoginService {
	
	//������ ���θ� üũ�Ѵ�.
	boolean loginAdmin(String adminId, String adminPwd);
	
	//��� ���θ� üũ�Ѵ�.
	boolean loginEmployee(String empNo, String empPwd);

}
