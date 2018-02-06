package com.bit.groupware.persistent.employee;

import java.util.Map;

public interface PhotoDAO {

	void insertPhoto(Map<String, Object> map);
	
	String checkSign(String empNo);
	
	void deletePhoto(String empNo);
	
	void deleteSign(String empNo);
}
