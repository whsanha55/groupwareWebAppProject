package com.bit.groupware.service.approval;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.TemplateBookmarkVO;
import com.bit.groupware.persistent.approval.TemplateBookmarkDAO;
@Service
public class TemplateBookmarkServiceImpl implements TemplateBookmarkService {
	
	@Autowired
	private TemplateBookmarkDAO templateBookmark;
	
	public void registerTemplateBookmark(TemplateBookmarkVO templateBookmarkVO) {
		templateBookmark.insertTemplateBookmark(templateBookmarkVO); 
	}

	public void removeTemplateBookmark(int bookmarkNo) {
		templateBookmark.deleteTemplateBookmark(bookmarkNo);

	}

}
