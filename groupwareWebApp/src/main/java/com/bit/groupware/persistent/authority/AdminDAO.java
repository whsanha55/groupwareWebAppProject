package com.bit.groupware.persistent.authority;

public interface AdminDAO {
	
	//관리자 여부를 확인한다.
	boolean loginAdmin(String adminId, String adminPwd);

}
