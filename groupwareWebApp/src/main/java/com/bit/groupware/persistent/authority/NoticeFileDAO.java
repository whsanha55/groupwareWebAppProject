package com.bit.groupware.persistent.authority;

import java.util.Map;

public interface NoticeFileDAO {
	
	//
	void insertNoticeFile(Map<String, Object> map);
	
	//
	void removeNoticeFile(Map<String, Object> map);

}
