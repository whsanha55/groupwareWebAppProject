package com.bit.groupware.service.approval;

import java.util.List;

import com.bit.groupware.domain.approval.TemplateCategoryVO;


public interface TemplateCategoryService {
	
	//��ļ� ī�װ� ��ü ��� ��ȸ
	List<TemplateCategoryVO> retrieveTemplateCategoryList();
	
	//��ļ� ī�װ� ���
	void registerTemplaeCategory(TemplateCategoryVO templateCategoryVO);
	
	//��ļ� ī�װ� ����
	void removeTemplateCategory(int categoryNo);
	
	//��ļ� ī�װ� ���� ��� ���� ��ȸ
	int retrieveCategoryCount(int categoryNo);

	//��ļ� ī�װ� �̻��
	void modifyTemplateCategory(int categoryNo);
	
	
}
