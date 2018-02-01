package com.bit.groupware.controller.employee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.bit.groupware.domain.employee.CodeVO;
import com.bit.groupware.service.employee.CodeService;

@Controller
public class AdminRemoveCodeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRemoveCodeController.class);

	@Autowired
	private CodeService codeService;
	
	//최상위 삭제 요청
	@RequestMapping(value="/admin/removeCode1.do")
	public String submit1(@ModelAttribute("code")CodeVO code) {
		logger.info("code : {}", code);
		codeService.removeCode(code.getcNo());
		return "redirect:/admin/listCode1.do";
	}
	
	//부서 코드 삭제 요청
	@RequestMapping(value="/admin/removeCode2.do")
	public String submit2(@ModelAttribute("code")CodeVO code) {
		logger.info("code : {}", code);
		codeService.removeCode(code.getcNo());
		return "redirect:/admin/listCode2.do?relationCode=" + code.getRelationCode();
	}
	
	//최하위 코드 삭제 요청
	@RequestMapping(value="/admin/removeCode3.do")
	public String submit3(@ModelAttribute("code")CodeVO code) {
		logger.info("code : {}", code);
		codeService.removeCode(code.getcNo());
		return "redirect:/admin/listCode3.do?relationCode=" + code.getRelationCode();
	}
}
