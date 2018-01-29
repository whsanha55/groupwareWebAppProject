package com.bit.groupware.service.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.TemplateCategoryVO;
import com.bit.groupware.persistent.approval.TemplateCategoryDAO;
@Service
public class TemplateCategoryServiceImpl implements TemplateCategoryService {
	@Autowired
	private TemplateCategoryDAO templateCategory;
	
	public List<TemplateCategoryVO> retrieveTemplateCategoryList() {
		return templateCategory.selectCategoryList(); 
	}

	public void registerTemplaeCategory(TemplateCategoryVO templateCategoryVO) {
		templateCategory.insertTemplateCategory(templateCategoryVO); 
	}

	public void removeTemplateCategory(int categoryNo) {
		templateCategory.deleteTemplateCategory(categoryNo); 
	}

}
