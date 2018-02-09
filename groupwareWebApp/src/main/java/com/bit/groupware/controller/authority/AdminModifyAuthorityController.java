package com.bit.groupware.controller.authority;

import java.util.HashMap;
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
public class AdminModifyAuthorityController {

	@Autowired
	private AuthorityService authorityService;
	
	private final static Logger logger = LoggerFactory.getLogger(AuthorityService.class);
	
	@RequestMapping(value="/modifyAuthorityAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> modifyAuth(AuthorityVO authority, @RequestParam(value="aName") String aName
														, @RequestParam(value="aName1") String aName1){
		logger.info("/////////retrieveAuthority//////////", authorityService.retrieveAuthorityByAname(aName));
		int name = authorityService.retrieveAuthorityByAname(aName); 
		logger.info("///////========================================//////////"+name);	
		Map<String, Object> map = new HashMap<String, Object>();
		if(name == 0) {
			logger.info("/////////ModifyAuthority 1///////////");	
			authorityService.modifyAuthority(authority);
			map.put("isSuccess", "true");
			map.put("authority", authority);
		} else {
			if(aName1.equals(aName)) {
				logger.info("/////////ModifyAuthority 2 ///////////" , authority);
				authorityService.modifyAuthority(authority);
				map.put("isSuccess", "true");
				map.put("authority", authority);
			}else {
				logger.info("/////////ModifyAuthority  3 ///////////" , authority);
				map.put("isSuccess", "false");
			}
		}
		return map;
	}
}
