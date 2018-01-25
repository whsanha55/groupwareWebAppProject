package com.bit.groupware.persistent.approval;

import com.bit.groupware.domain.approval.TemplateBookmarkVO;

public interface TemplateBookmarkDAO {

	void insertTemplateBookmark(TemplateBookmarkVO templateBookmark);
	
	void deleteTemplateBookmark(int bookmarkNo);
}
