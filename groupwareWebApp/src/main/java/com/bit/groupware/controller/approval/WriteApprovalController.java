package com.bit.groupware.controller.approval;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView form(@RequestParam(required=false, defaultValue="0") int tmpNo ) {
		ModelAndView mv = new ModelAndView();
		if(tmpNo > 0) {
			mv.addObject("template",templateService.retrieveTemplate(tmpNo));
		}
		mv.setViewName("approval/writeApproval");
		return mv;
	}

	// 문서 상신
	@RequestMapping(value = "/writeApproval.do", method = RequestMethod.POST)
	public String submit() {

		// 문서 작성 서비스 호출~~ 처리~~

		return "redirect:/approval/requestList";
	}

}
