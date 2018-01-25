package com.bit.groupware.persistent.approval;

import java.util.List;

import com.bit.groupware.domain.approval.TemplateCategoryVO;

public interface TemplateCategoryDAO {

	List<TemplateCategoryVO> selectCategoryList();
	
	void insertTemplateCategory(TemplateCategoryVO category);
	
	void deleteTemplateCategory(int categoryNo);
}
