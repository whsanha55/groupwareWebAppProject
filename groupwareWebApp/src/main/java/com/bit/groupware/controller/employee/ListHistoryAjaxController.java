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
import com.bit.groupware.domain.employee.CodeHistoryVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.employee.CodeService;

@Controller
public class ListHistoryAjaxController {
	private static final Logger logger = LoggerFactory.getLogger(ListHistoryAjaxController.class);
	@Autowired
	private CodeService codeService;
	
	//코드 변경 이력 조회하기 (관리자)
	@RequestMapping(value="/admin/listAjaxCodeHistory.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> form(
						@RequestParam(required=false) String keyfield,
						@RequestParam(required=false) String keyword,
						@RequestParam int startRow,
						@RequestParam int endRow) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		logger.info("map : {}", map);
		int totalCount = codeService.retrieveHistoryCount(map);
		if(totalCount < endRow) {
			endRow = totalCount;
		}
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<CodeHistoryVO> histories = codeService.retrieveCodeHistoryListByAdmin(map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("totalCount", totalCount);
		returnMap.put("histories", histories);
		return returnMap;
	}
	
	@RequestMapping(value="/admin/removeHistory.do", method=RequestMethod.POST)
	@ResponseBody
	public String removeAjaxController(@RequestParam("no")int no) {
		codeService.removeHistory(no);
		return "yes";
	}
}
