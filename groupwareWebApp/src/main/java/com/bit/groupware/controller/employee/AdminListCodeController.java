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
	
	//�ֻ��� �ڵ� ��� ��ȸ ��û
	@RequestMapping(value="/admin/listCode1.do", method=RequestMethod.GET)
	public ModelAndView listCode1() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("keyfield", "�ڵ��ȣ");
		map.put("keyword", "�ڵ��");
		logger.info("map : {}", map);
		mv.addObject("codes", codeService.retrieveCodeList1(map));
		mv.setViewName("employee/admin_listCode1");
		return mv;
	}
	
	//�ֻ��� �ڵ� ��� �˻�
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
	
	//���� �ڵ� ��� ��ȸ ��û
	@RequestMapping(value="/admin/listCode2.do", method=RequestMethod.GET)
	public ModelAndView listCode2(@RequestParam(value="relationCode", required=true) String relationCode) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("relationCode", relationCode);
		map.put("keyfield", "�ڵ��ȣ");
		map.put("keyword", "�ڵ��");
		logger.info("map : {}", map);
		mv.addObject("codes", codeService.retrieveCodeList2(map));
		mv.setViewName("employee/admin_listCode2");
		return mv;
	}
	
	//������ �ڵ� ��� ��ȸ ��û
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
