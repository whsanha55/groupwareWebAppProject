package com.bit.groupware.controller.employee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.bit.groupware.domain.employee.CodeVO;
import com.bit.groupware.service.employee.CodeService;

@Controller
public class AdminModifyCodeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminModifyCodeController.class);
	
	@Autowired
	private CodeService codeService;
	
	//코드 수정 요청
	@RequestMapping(value="/admin/modifyCode.do", method=RequestMethod.POST)
	public String modifyCode(@ModelAttribute("code") CodeVO code, SessionStatus status) {
		logger.info("code : {}", code);
		codeService.modifyCode(code);
		status.setComplete();
		return "redirect:/admin/listCode1.do";
	}
}
