package com.bit.groupware.service.approval;

import com.bit.groupware.domain.approval.TemplateBookmarkVO;

public interface TemplateBookmarkService {

	//양식서 즐겨찾기 추가
	void registerTemplateBookmark(TemplateBookmarkVO templateBookmarkVO);
	
	//양식서 즐겨찾기 삭제
	void removeTemplateBookmark(int bookmarkNo);

	
}
