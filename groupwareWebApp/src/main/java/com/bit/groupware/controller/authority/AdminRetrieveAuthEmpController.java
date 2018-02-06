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
public class AdminRetrieveAuthEmpController {
	
	@Autowired
	private AuthorityService authorityService;

	private static final Logger logger = LoggerFactory.getLogger(AdminRetrieveAuthEmpController.class);
	
	@RequestMapping(value="/retrieveAuthEmpAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> form(@RequestParam(value="aNo") String aNo){
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("////////////retrieveAuthEmp///////////////", authorityService.retrieveAuthEmpList(aNo));
		List<AuthorityVO> authorities = authorityService.retrieveAuthEmpList(aNo);
		map.put("authorities", authorities);
		return map;
	}
	
}
