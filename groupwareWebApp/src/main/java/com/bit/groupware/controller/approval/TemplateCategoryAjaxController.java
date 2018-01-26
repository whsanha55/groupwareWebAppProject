package com.bit.groupware.controller.approval;

import java.security.Principal;
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

	@RequestMapping(value = "/templateCategoryAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public List<TemplateVO> getTemplateList(
			@RequestParam(required = false) int categoryNo,
			@RequestParam(required = false) String categoryName, 
			@RequestParam(required = false) String tmpName ,
			@RequestParam int startRow,
			@RequestParam int endRow,
			Principal principal) {
		Map<String, Object> map = new HashMap<String, Object>();
//		 사원번호
//		map.put("empNo",principal.getName() );
		map.put("empNo", "2018-00011");
		
		
		if (categoryNo != 0) {
			if(categoryNo >0) {
				map.put("keyfield", "categoryNo");
				map.put("keyword", categoryNo);
			} else {
				map.put("keyfield", "bookmark");
			}
		} else if (categoryName != null) {
			map.put("keyfield", "categoryName");
			map.put("keyword", categoryName);
		} else {
			map.put("keyfield", "tmpName");
			map.put("keyword", tmpName);
		}
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<TemplateVO> templates = templateService.retrieveTemplateList(map);
		return templates;
	}
}
