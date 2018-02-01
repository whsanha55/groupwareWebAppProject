package com.bit.groupware.controller.employee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	//최상위 코드 수정 폼 요청
	@RequestMapping(value="/admin/modifyCode1.do", method=RequestMethod.GET)
	public ModelAndView form1(@RequestParam(value="cNo", required=true) String cNo) {
		logger.info("cNo : {}", cNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("code", codeService.retrieveCode(cNo));
		mv.setViewName("employee/admin_modifyCode1");
		return mv;
	}
	
	//최상위 코드 수정 요청
	@RequestMapping(value="/admin/modifyCode1.do", method=RequestMethod.POST)
	@ResponseBody
	public int submit1(@ModelAttribute("code")CodeVO code) {
		logger.info("code : {} ", code);
		if(codeDAO.checkCode(code.getcName()) == true) {
			codeService.modifyCode(code);
			return 1;
		} else {
			return 0;
		} 
	} 
	
	//부서 코드 수정 폼 요청
	@RequestMapping(value="/admin/modifyCode2.do", method=RequestMethod.GET)
	public ModelAndView form2(@RequestParam(value="cNo", required=true) String cNo) {
		logger.info("cNo : {}", cNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("code", codeService.retrieveCode(cNo));
		mv.setViewName("employee/admin_modifyCode2");
		return mv;
	}
		
	//부서 코드 수정 요청
	@RequestMapping(value="/admin/modifyCode2.do", method=RequestMethod.POST)
	@ResponseBody
	public int submit2(@ModelAttribute("code")CodeVO code) {
		logger.info("code : {} ", code);
		if(codeDAO.checkCode(code.getcName()) == true) {
			codeService.modifyCode(code);
			return 1;
		} else {
			return 0;
		} 
	}
	
	//최하위 코드 수정 폼 요청
	@RequestMapping(value="/admin/modifyCode3.do", method=RequestMethod.GET)
	public ModelAndView form3(@RequestParam(value="cNo", required=true) String cNo) {
		logger.info("cNo : {}", cNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("code", codeService.retrieveCode(cNo));
		mv.setViewName("employee/admin_modifyCode3");
		return mv;
	}
			
	//최하위 코드 수정 요청
	@RequestMapping(value="/admin/modifyCode3.do", method=RequestMethod.POST)
	@ResponseBody
	public int submit3(@ModelAttribute("code")CodeVO code) {
		logger.info("code : {} ", code);
		if(codeDAO.checkCode(code.getcName()) == true) {
			codeService.modifyCode(code);
			return 1;
		} else {
			return 0;
		} 
	}
}
