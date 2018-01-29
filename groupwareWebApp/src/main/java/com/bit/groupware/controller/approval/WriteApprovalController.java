package com.bit.groupware.controller.approval;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.service.approval.TemplateCategoryService;
import com.bit.groupware.service.approval.TemplateService;

@Controller
public class WriteApprovalController {

	@Autowired
	private TemplateCategoryService categoryService;

	@Autowired
	private TemplateService templateService;

	// 문서 작성 - 양식 고르기
	// public ModelAndView category(@AuthenticationPrincipal UserDetailsCustom udc)
	@RequestMapping(value = "/selectCategory.do", method = RequestMethod.GET)
	public ModelAndView category() {
		
		ModelAndView mv = new ModelAndView();

		// 카테고리 리스트 조회 및 바인딩
		mv.addObject("categoryList", categoryService.retrieveTemplateCategoryList());

		mv.setViewName("approval/selectCategory");
		return mv;
	}

	// 문서 작성 폼 요청
	@RequestMapping(value = "/writeApproval.do", method = RequestMethod.GET)
	public String form() {
		return "approval/writeApproval";
	}

	// 문서 상신
	@RequestMapping(value = "/writeApproval.do", method = RequestMethod.POST)
	public String submit() {

		// 문서 작성 서비스 호출~~ 처리~~

		return "redirect:/approval/requestList";
	}

}
