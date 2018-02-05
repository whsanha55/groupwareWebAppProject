package com.bit.groupware.controller.employee;

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
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.CodeVO;
import com.bit.groupware.service.employee.CodeService;

@Controller
public class AdminListCodeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminListCodeController.class);
	@Autowired
	private CodeService codeService;
	
	//최상위 코드 목록 조회 요청
	@RequestMapping(value="/admin/listCode1.do", method=RequestMethod.GET)
	public ModelAndView listCode1() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("keyfield", "코드번호");
		map.put("keyword", "코드명");
		logger.info("map : {}", map);
		mv.addObject("codes", codeService.retrieveCodeList1(map));
		mv.setViewName("employee/admin_listCode1");
		return mv;
	}
	
	//최상위 코드 목록 검색
	@RequestMapping(value="/admin/listCodeAjax1.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> form(
						@RequestParam(required=false) String keyfield,
						@RequestParam(required=false) String keyword,
						@RequestParam int startRow,
						@RequestParam int endRow
						) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		int totalCount = codeService.retrieveCodeCount(map);
		if(totalCount < endRow) {
			endRow = totalCount;
		}
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<CodeVO> codes = codeService.retrieveCodeList1(map);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("totalCount", totalCount);
		returnMap.put("codes", codes);
		logger.info("returnMap : {}", returnMap);
		return returnMap;
	}
	
	//하위 코드 목록 조회 요청
	@RequestMapping(value="/admin/listCode2.do", method=RequestMethod.GET)
	public ModelAndView listCode2(@RequestParam(value="relationCode", required=true) String relationCode) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("relationCode", relationCode);
		map.put("keyfield", "코드번호");
		map.put("keyword", "코드명");
		logger.info("map : {}", map);
		mv.addObject("codes", codeService.retrieveCodeList2(map));
		mv.setViewName("employee/admin_listCode2");
		return mv;
	}
	
	//최하위 코드 목록 조회 요청
	@RequestMapping(value="/admin/listCode3.do", method=RequestMethod.GET)
	public ModelAndView listCode3(@RequestParam(value="relationCode", required=true) String relationCode) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("relationCode", relationCode);
		map.put("startRow", 1);
		map.put("endRow", 10);
		logger.info("map : {}", map);
		mv.addObject("codes", codeService.retrieveCodeList3(map));
		mv.setViewName("employee/admin_listCode3");
		return mv;
	}
	
}
