package com.bit.groupware.service.approval;

import com.bit.groupware.domain.approval.TemplateBookmarkVO;

public interface TemplateBookmarkService {

	//��ļ� ���ã�� �߰�
	int registerTemplateBookmark(TemplateBookmarkVO templateBookmarkVO);
	
	//��ļ� ���ã�� ����
	void removeTemplateBookmark(int bookmarkNo);

	
}
