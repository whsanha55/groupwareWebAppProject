package com.bit.groupware.controller.employee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.bit.groupware.service.employee.CodeService;

@Controller
public class CheckRelationCodeController {
	private static final Logger logger = LoggerFactory.getLogger(CheckRelationCodeController.class);
	
	@Autowired
	private CodeService codeService;
	
	/*//���� �ڵ� �� Ȯ��
	@RequestMapping(value="/admin/checkRelationCode.do", method=RequestMethod.GET)*/
	
}
