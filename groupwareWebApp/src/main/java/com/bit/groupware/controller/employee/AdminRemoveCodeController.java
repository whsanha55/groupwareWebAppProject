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
	
	//코드 삭제 요청
	@RequestMapping(value="/admin/removeCode.do")
	public String submit(@ModelAttribute("code") CodeVO code, SessionStatus status) {
		logger.info("code : {}", code);
		if(codeService.removeCode(code) == 0) {
			codeService.removeCode(code);
			return "redirect:/admin/listCode1.do";
		} else {
			return "redirect:/admin/removeCode.do?cNo=" + code.getcNo();
		}
		
	}
}
