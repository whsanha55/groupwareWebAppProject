package com.bit.groupware.persistent.employee;

import java.util.Map;

public interface PhotoDAO {

	void insertPhoto(Map<String, Object> map);
	
	void deletePhoto(String photoNo);
}
