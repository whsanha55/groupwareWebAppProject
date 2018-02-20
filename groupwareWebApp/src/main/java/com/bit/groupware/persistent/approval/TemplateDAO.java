package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.TemplateCategoryVO;
import com.bit.groupware.domain.approval.TemplateVO;

public interface TemplateDAO {

	List<TemplateVO> selectTemplateList(Map<String, Object> map);

	TemplateVO selectTemplate(int tmpNo);

	void insertTemplate(TemplateVO template);

	void deleteTemplate(Map<String, Object> map);

	int selectTemplateCount(Map<String, Object> map);

	List<TemplateVO> selectTemplateNameList();

	List<TemplateVO> selectTemplateListByCategoryNo(Map<String, Integer> map);

	void updateTemplateUsing(Map<String, Object> map);
}
