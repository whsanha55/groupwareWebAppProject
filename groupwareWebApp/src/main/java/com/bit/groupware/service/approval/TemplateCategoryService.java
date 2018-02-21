package com.bit.groupware.service.approval;

import java.util.List;

import com.bit.groupware.domain.approval.TemplateCategoryVO;


public interface TemplateCategoryService {
	
	//양식서 카테고리 전체 목록 조회
	List<TemplateCategoryVO> retrieveTemplateCategoryList();
	
	//양식서 카테고리 등록
	void registerTemplaeCategory(TemplateCategoryVO templateCategoryVO);
	
	//양식서 카테고리 삭제
	void removeTemplateCategory(int categoryNo);
	
	//양식서 카테고리 하위 양식 개수 조회
	int retrieveCategoryCount(int categoryNo);

	//양식서 카테고리 미사용
	void modifyTemplateCategory(int categoryNo);
	
	
}
