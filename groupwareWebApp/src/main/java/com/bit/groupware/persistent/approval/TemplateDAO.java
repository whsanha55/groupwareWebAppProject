package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.TemplateVO;

public interface TemplateDAO {

	List<TemplateVO> selectTemplateList(Map<String, Object> map);

	TemplateVO selectTemplate(int tmpNo);

	void insertTemplate(TemplateVO template);

	void deleteTemplate(List<Integer> tmpNos);
	
	int selectTemplateCount(Map<String, Object> map); 
}
