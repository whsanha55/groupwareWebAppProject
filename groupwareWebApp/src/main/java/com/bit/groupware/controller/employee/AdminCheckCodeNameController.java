package com.bit.groupware.controller.employee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.bit.groupware.service.employee.CodeService;

@Controller
public class AdminCheckCodeNameController {
	private static final Logger logger = LoggerFactory.getLogger(AdminCheckCodeNameController.class);
	
	@Autowired
	private CodeService codeService;
	
	/*//코드명 중복 체크
	@RequestMapping(value="/admin/checkCodeName.do", method=RequestMethod.POST)
	public ch*/
}
