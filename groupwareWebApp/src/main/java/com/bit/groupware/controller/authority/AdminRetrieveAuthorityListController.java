package com.bit.groupware.controller.authority;

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

import com.bit.groupware.domain.authority.AuthorityVO;
import com.bit.groupware.service.authority.AuthorityService;

@Controller
public class AdminRetrieveAuthorityListController {

	@Autowired
	private AuthorityService authorityService;
	
	private final static Logger logger = LoggerFactory.getLogger(AdminRetrieveAuthorityListController.class);
	
	@RequestMapping(value="/admin/authorityList.do", method=RequestMethod.GET)
	public String form() {
		return "authority/admin_authorityList";
	}
	
	@RequestMapping(value="/AuthorityPagingAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAuthList(@RequestParam String keyfield ,
											@RequestParam(required=false) String keyword ,
											@RequestParam int startRow ,
											@RequestParam int endRow){
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		int totalCount = authorityService.retrieveAuthorityCount(map);
		if(totalCount < endRow) {
			endRow = totalCount;
		}
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<AuthorityVO> authorities = authorityService.retrieveAuthorityList(map);
		Map<String,Object> returnMap = new HashMap<String, Object>();
		logger.info("/////////////retrieveAuthorityList///////////" , authorities);
		returnMap.put("totalCount", totalCount);
		returnMap.put("authorities", authorities);
		
		return returnMap;
	}
	
}
