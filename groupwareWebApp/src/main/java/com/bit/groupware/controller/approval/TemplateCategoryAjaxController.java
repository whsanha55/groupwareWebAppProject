package com.bit.groupware.controller.approval;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.approval.TemplateVO;
import com.bit.groupware.service.approval.TemplateService;

@Controller
public class TemplateCategoryAjaxController {

	@Autowired
	private TemplateService templateService;
	
	@RequestMapping(value="/templateCategoryAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public List<TemplateVO> getTemplateList(
			@RequestParam(required=false) int categoryNo ,
			@RequestParam(required=false) String categoryName ,
			@RequestParam(required=false) String tmpName) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("keyfield", "categoryNo");
		map.put("keyword", categoryNo);
		map.put("categoryName", categoryName);
		map.put("tmpName", tmpName);
		map.put("startRow", 0);
		map.put("endRow", 10);
		List<TemplateVO> templates = templateService.retrieveTemplateList(map);
		return templates; 
	}
}
