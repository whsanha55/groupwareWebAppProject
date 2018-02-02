package com.bit.groupware.persistent.authority;

import java.util.Map;

public interface PostFileDAO {
	
	//
	void insertPostFile(Map<String, Object> map);
	
	//
	void deletePostFile(int postNo);
	
	void deletePostFile2(int no);

}
