package com.bit.groupware.controller.employee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		return "employee/admin_insertCode1/pop";	
	}
	
	//최상위 코드 등록 요청
	@RequestMapping(value="/admin/registerCode1.do", method=RequestMethod.POST)
	@ResponseBody
	public int submit1(CodeVO code) throws Exception {
		logger.info("code : {} ", code);
		if(codeDAO.checkCodeNo(code.getcNo()) == true && codeDAO.checkCode(code.getcName()) == true) {
			codeService.registerCode(code);
			return 1;
		} else {
			return 0;
		}
	} 
	
	//부서 코드 등록 폼 요청
	@RequestMapping(value="/admin/registerCode2.do", method=RequestMethod.GET)
	public String form2() {
		return "employee/admin_insertCode2/pop";
	}
			
	//부서 코드 등록 요청
	@RequestMapping(value="/admin/registerCode2.do", method=RequestMethod.POST)
	@ResponseBody
	public int submit2(CodeVO code) {
		logger.info("code : {} ", code);
		if(codeDAO.checkCodeNo(code.getcNo()) == true && codeDAO.checkCode(code.getcName()) == true) {
			codeService.registerCode(code);
			return 1;
		} else {
			return 0;
		}
	} 
	
	//최하위 코드 등록 폼 요청
	@RequestMapping(value="/admin/registerCode3.do", method=RequestMethod.GET)
	public String form3() {
		return "employee/admin_insertCode3/pop";
	}
		
	//최하위 코드 등록 요청
	@RequestMapping(value="/admin/registerCode3.do", method=RequestMethod.POST)
	@ResponseBody
	public int submit3(CodeVO code) {
		logger.info("code : {} ", code);
		if(codeDAO.checkCodeNo(code.getcNo()) == true && codeDAO.checkCode(code.getcName()) == true) {
			codeService.registerCode(code);
			return 1;
		} else {
			return 0;
		}
	} 
}
