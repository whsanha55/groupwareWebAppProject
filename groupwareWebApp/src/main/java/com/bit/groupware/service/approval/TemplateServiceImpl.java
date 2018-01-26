package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.TemplateVO;
import com.bit.groupware.persistent.approval.TemplateDAO;
@Service
public class TemplateServiceImpl implements TemplateService {
	@Autowired
	private TemplateDAO templateDAO;
	
	public List<TemplateVO> retrieveTemplateList(Map<String, Object> map) {
		return templateDAO.selectTemplateList(map);
	}

	public TemplateVO retrieveTemplate(int tmpNo) {
		return templateDAO.selectTemplate(tmpNo);
	}

	public void registerTemplate(TemplateVO templateVO) {
		templateDAO.insertTemplate(templateVO);
 
	}

	public void removeTemplate(int tmpNo) {
		templateDAO.deleteTemplate(tmpNo); 

	}

}
