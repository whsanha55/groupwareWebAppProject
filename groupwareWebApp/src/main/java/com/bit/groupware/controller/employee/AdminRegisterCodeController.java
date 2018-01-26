package com.bit.groupware.controller.employee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.groupware.domain.employee.CodeVO;
import com.bit.groupware.service.employee.CodeService;

@Controller
public class AdminRegisterCodeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRegisterCodeController.class);
	@Autowired
	private CodeService codeService;
	
	
	//코드 등록 요청
	@RequestMapping(value="/admin/registerCode.do", method=RequestMethod.POST)
	public String submit(CodeVO code) {
		logger.info("code : {} ", code);
		codeService.registerCode(code);
		return "redirect:/admim/listCode.do";
	}
	
}
