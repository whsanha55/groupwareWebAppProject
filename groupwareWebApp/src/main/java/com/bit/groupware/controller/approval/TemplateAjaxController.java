package com.bit.groupware.controller.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.approval.TemplateVO;
import com.bit.groupware.service.approval.TemplateService;

@Controller
public class TemplateAjaxController {
	
	@Autowired
	private TemplateService templateService;
	
	@RequestMapping(value = "/templatePagingAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getTemplateList(
			@RequestParam(required=false) String keyfield,
			@RequestParam(required=false) String keyword ,
			@RequestParam int startRow ,
			@RequestParam int endRow
			) {
		Map<String, Object> map = new HashMap<String, Object>();

//		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		map.put("empNo", user.getUsername());
		map.put("empNo", "2018-00011");		
		
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
			
		int totalCount = templateService.retrieveTemplateCount(map);
		if(totalCount < endRow) {
			endRow = totalCount;				
		}
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<TemplateVO> templates = templateService.retrieveTemplateList(map);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("totalCount", totalCount);
		returnMap.put("templates", templates);
		return returnMap;
	}
}
