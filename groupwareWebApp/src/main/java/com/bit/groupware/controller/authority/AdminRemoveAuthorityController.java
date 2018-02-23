package com.bit.groupware.controller.authority;

import java.util.ArrayList;
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

import com.bit.groupware.service.authority.AuthorityService;

@Controller
public class AdminRemoveAuthorityController {

	@Autowired
	private AuthorityService authorityService;
	
	private static Logger logger = LoggerFactory.getLogger(AuthorityService.class);
	
	@RequestMapping(value="/RemoveAuthorityAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> removeAuth(@RequestParam(value="aNo") List<String> aNos) {
		logger.info("¹øÈ£///////// : {}", aNos);
		List<String> aNoList = new ArrayList<String>();
		for(String aNo : aNos) {
			aNoList.add(aNo);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", aNoList);
		
		logger.info("////////////AuthRoleCount", authorityService.retrieveAtuhRoleCount(map));
		int no = authorityService.retrieveAtuhRoleCount(map);
		int empNo = authorityService.retrieveAuthEmpCountByaNo(map);
		if(no == 0 && empNo ==0) {
			logger.info("//////removeAuthority", map);
			authorityService.removeAuthority(map);
			map.put("isSuccess", "true");
		}else {
			map.put("isSuccess", "false");
		}
		return map;
	}
	
}
