package com.bit.groupware.controller.employee;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.service.employee.CodeService;

@Controller
public class AdminListHistoryController {
	private static final Logger logger = LoggerFactory.getLogger(AdminListHistoryController.class);
	@Autowired
	private CodeService codeService;
	
	//코드 변경 이력 조회하기 (관리자)
	@RequestMapping(value="/admin/listCodeHistory.do", method=RequestMethod.GET)
	public ModelAndView listCodeHistoryByAdmin() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", "검색조건");
		map.put("keyword", "검색어");
		logger.info("map : {}", map);
		mv.addObject("codeHistories", codeService.retrieveCodeHistoryListByAdmin(map));
		mv.setViewName("employee/admin_codeHistory");
		return mv;
	}
	
	//코드 변경 이력 조회하기 (사용자)
	@RequestMapping(value="/listCodeHistory.do", method=RequestMethod.GET)
	public ModelAndView listCodeHistory(@RequestParam(value="empNo", required=true) String empNo) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("keyfield", "검색조건");
		map.put("keyword", "검색어");
		logger.info("map : {}", map);
		mv.addObject("codeHistories", codeService.retrieveCodeHistoryList(map));
		mv.setViewName("employee/codeHistory");
		return mv;
	}

}
