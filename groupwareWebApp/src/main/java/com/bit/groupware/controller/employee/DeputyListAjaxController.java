package com.bit.groupware.controller.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.domain.employee.DeputyVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.employee.CodeService;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class DeputyListAjaxController {
	private static final Logger logger = LoggerFactory.getLogger(DeputyListAjaxController.class);
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private CodeService codeService;
	
	@RequestMapping(value="/listDeputyAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> form(
						@RequestParam(value="keyfield",required=false) String keyfield,
						@RequestParam(value="keyword",required=false) String keyword,
						@RequestParam(value="keyword1",required=false) String keyword1,
						@RequestParam int startRow,
						@RequestParam int endRow
						) {
		Map<String, Object> map = new HashMap<String, Object>();
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		UserVO user = (UserVO)authentication.getPrincipal();

 		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("keyword1", keyword1);
		map.put("empNo", user.getUsername());
		int totalCount = employeeService.retrieveDeputyListCount(map);
		if(totalCount < endRow) {
			endRow = totalCount;
		}
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("totalCount", totalCount);
		returnMap.put("deputies", employeeService.retrieveDeputyList(map));
		logger.info("returnMap : {}", returnMap);
		return returnMap;
		
	}
}
