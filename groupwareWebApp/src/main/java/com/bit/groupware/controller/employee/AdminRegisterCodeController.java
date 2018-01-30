package com.bit.groupware.controller.employee;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	//코드 등록 폼 요청
	@RequestMapping(value="/admin/registerCode.do", method=RequestMethod.GET)
	public String form() {
		return "employee/admin_insertCode1";
	}
	
	//코드 등록 요청
	@RequestMapping(value="/admin/registerCode.do", method=RequestMethod.POST)
	public String submit(CodeVO code) {
		logger.info("code : {} ", code);
		if(codeDAO.checkCodeNo(code.getcNo()) == true && codeDAO.checkCode(code.getcName()) == true) {
			codeService.registerCode(code);
			return "redirect:/admin/listCode1.do";
		} else {
			return "employee/admin_modifyCode1";
		} 
	} 
}
