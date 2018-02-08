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

import com.bit.groupware.domain.authority.AuthEmpListVO;
import com.bit.groupware.service.authority.AuthorityService;


@Controller
public class AdminDesignateAuthorityController {

	@Autowired
	private AuthorityService authorityService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDesignateAuthorityController.class);
	
	@RequestMapping(value="/admin/designAuthority.do", method=RequestMethod.GET)
	public String form() {
		return "authority/admin_designateAuthority";
	}
	
	@RequestMapping(value="/AuthEmpListAjax.do" , method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAuthEmpList(@RequestParam String keyfield ,
			@RequestParam(required=false) String keyword ,
			@RequestParam int startRow ,
			@RequestParam int endRow, @RequestParam(value="aNo") String aNo){
	
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("aNo", aNo);
		
		int totalCount = authorityService.retrieveAuthEmpCount(map);
		if(totalCount < endRow) {
			endRow = totalCount;
		}
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<AuthEmpListVO> authEmps = authorityService.retrieveAuthEmpList(map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		logger.info("/////////////retrieveAuthEmpList///////////" , authEmps);
		returnMap.put("totalCount", totalCount);
		returnMap.put("authEmps", authEmps);
		returnMap.put("aNo", aNo);
		
		
		return returnMap;
	}
	
}
