package com.bit.groupware.controller.employee;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.CodeVO;
import com.bit.groupware.persistent.employee.CodeDAO;
import com.bit.groupware.service.employee.CodeService;

@Controller
public class AdminRegisterCodeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRegisterCodeController.class);
	@Autowired
	private CodeService codeService;
	@Autowired
	private CodeDAO codeDAO;
	
	//최상위 코드 등록 폼 요청
	@RequestMapping(value="/admin/registerCode1.do", method=RequestMethod.GET)
	public String form1() {
		return "employee/admin_insertCode1";
	}
	
	//최상위 코드 등록 요청
	@RequestMapping(value="/admin/registerCode1.do", method=RequestMethod.POST)
	public String submit1(CodeVO code) {
		logger.info("code : {} ", code);
		if(codeDAO.checkCodeNo(code.getcNo()) == true && codeDAO.checkCode(code.getcName()) == true) {
			codeService.registerCode(code);
			return "redirect:/admin/listCode1.do";
		} else {
			return "employee/admin_insertCode1";
			
		} 
	} 
	
	//부서 코드 등록 폼 요청
	@RequestMapping(value="/admin/registerCode2.do", method=RequestMethod.GET)
	public ModelAndView form2() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("codes", codeService.retrieveDeptCodeList());
		mv.setViewName("employee/admin_insertCode2");
		return mv;
	}
			
	//부서 코드 등록 요청
	@RequestMapping(value="/admin/registerCode2.do", method=RequestMethod.POST)
	public String submit2(CodeVO code) {
		logger.info("code : {} ", code);
		if(codeDAO.checkCodeNo(code.getcNo()) == true && codeDAO.checkCode(code.getcName()) == true) {
			codeService.registerCode(code);
			return "redirect:/admin/listCode2.do?relationCode=" + code.getRelationCode();
		} else {
			return "redirect:/admin/registerCode2.do";
		} 
	} 
	
	//최하위 코드 등록 폼 요청
	@RequestMapping(value="/admin/registerCode3.do", method=RequestMethod.GET)
	public ModelAndView form3() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("startRow", 1);
		map.put("endRow", 10);
		logger.info("map : {}", map);
		mv.addObject("codes", codeService.retrieveCodeList1(map));
		mv.setViewName("employee/admin_insertCode3");
		return mv;
	}
		
	//최하위 코드 등록 요청
	@RequestMapping(value="/admin/registerCode3.do", method=RequestMethod.POST)
	public String submit3(CodeVO code) {
		logger.info("code : {} ", code);
		if(codeDAO.checkCodeNo(code.getcNo()) == true && codeDAO.checkCode(code.getcName()) == true) {
			codeService.registerCode(code);
			return "redirect:/admin/listCode3.do?relationCode=" + code.getRelationCode();
		} else {
			return "redirect:/admin/registerCode3.do";
		} 
	} 
}
