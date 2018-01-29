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

	public void removeTemplate(List<Integer> tempNos) {
		// TODO Auto-generated method stub
		templateDAO.deleteTemplate(tempNos);
	}

	public int retrieveTemplateCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return templateDAO.selectTemplateCount(map);
	}
	

}