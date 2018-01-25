package com.bit.groupware.persistent.authority;

import java.util.Map;

public interface PostFileDAO {
	
	//
	void insertPostFile(Map<String, Object> map);
	
	//
	void removePostFile(Map<String, Object> map);

}
