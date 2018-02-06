package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.controller.approval.AdminTemplateController;
import com.bit.groupware.domain.approval.TemplateVO;
import com.bit.groupware.persistent.approval.TemplateDAO;

@Service
public class TemplateServiceImpl implements TemplateService {
	
	private final static Logger logger = LoggerFactory.getLogger(AdminTemplateController.class);
	
	@Autowired
	private TemplateDAO templateDAO;
	
	public List<TemplateVO> retrieveTemplateList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return templateDAO.selectTemplateList(map); 
	}
	

	public TemplateVO retrieveTemplate(int tmpNo) {
		// TODO Auto-generated method stub
		return templateDAO.selectTemplate(tmpNo); 
	}

	public void registerTemplate(TemplateVO templateVO) {
		// TODO Auto-generated method stub
		templateDAO.insertTemplate(templateVO);
	}

	public void removeTemplate(Map<String, Object> map) {
		templateDAO.deleteTemplate(map);
	}

	public int retrieveTemplateCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return templateDAO.selectTemplateCount(map);
	}


	public List<String> retrieveTemplateNameList() {
		return templateDAO.selectTemplateNameList();
	}
	
	public void updateTemplateUsing(Map<String, Object> map) {
		templateDAO.updateTemplateUsing(map);
	}
	

}
