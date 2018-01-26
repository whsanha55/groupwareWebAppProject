package com.bit.groupware.controller.employee;

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
public class ListCodeController {
	private static final Logger logger = LoggerFactory.getLogger(ListCodeController.class);
	@Autowired
	private CodeService codeService;
	
	//코드 목록 조회 요청
	@RequestMapping(value="/admin/listCode.do", method=RequestMethod.GET)
	public ModelAndView listCode(@RequestParam(value="map") Map<String, Object> map ) {
		logger.info("map : {}", map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("codes", codeService.retrieveCodeList(map));
		mv.setViewName("admin_codeList");
		return mv;
	}
	
}
