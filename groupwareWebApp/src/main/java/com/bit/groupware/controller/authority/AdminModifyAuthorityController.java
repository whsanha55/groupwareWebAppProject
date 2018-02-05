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
	public Map<String, String> modifyAuth(AuthorityVO authority, @RequestParam(value="aName") String aName){
		logger.info("/////////retrieveAuthority//////////", authorityService.retrieveAuthorityByaNo(authority.getaNo()));
		int name = authorityService.retrieveAuthorityByAname(aName); 
		Map<String, String> map = new HashMap<String, String>();
		if(name < 0) {
			logger.info("/////////ModifyAuthority  수정완료 ! ///////////" , authority);	
			authorityService.modifyAuthority(authority);
			map.put("isSuccess", "true");
		} else {
			map.put("isSuccess", "false");
		}
		return map;
	}
}
