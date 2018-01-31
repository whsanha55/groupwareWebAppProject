package com.bit.groupware.controller.employee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.CodeVO;
import com.bit.groupware.persistent.employee.CodeDAO;
import com.bit.groupware.service.employee.CodeService;

@Controller
public class AdminModifyCodeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminModifyCodeController.class);
	
	@Autowired
	private CodeService codeService;
	@Autowired
	private CodeDAO codeDAO;
	
	//코드 수정 폼 요청
	@RequestMapping(value="/admin/modifyCode.do", method=RequestMethod.GET)
	public ModelAndView form(@RequestParam(value="cNo", required=true) String cNo) {
		logger.info("cNo : {}", cNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("code", codeService.retrieveCode(cNo));
		mv.setViewName("employee/admin_modifyCode1");
		return mv;
	}
	
	//코드 수정 요청
	@RequestMapping(value="/admin/modifyCode.do", method=RequestMethod.POST)
	public String submit(@ModelAttribute("code")CodeVO code) {
		logger.info("code : {} ", code);
		if(codeDAO.checkCode(code.getcName()) == true) {
			codeService.modifyCode(code);
			return "redirect:/admin/listCode1.do";
		} else {
			return "employee/admin_insertCode1";
		} 
	} 
}
