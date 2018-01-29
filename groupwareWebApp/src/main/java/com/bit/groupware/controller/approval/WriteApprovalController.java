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

	// ���� �ۼ� - ��� ����
	// public ModelAndView category(@AuthenticationPrincipal UserDetailsCustom udc)
	@RequestMapping(value = "/selectCategory.do", method = RequestMethod.GET)
	public ModelAndView category() {
		
		ModelAndView mv = new ModelAndView();

		// ī�װ� ����Ʈ ��ȸ �� ���ε�
		mv.addObject("categoryList", categoryService.retrieveTemplateCategoryList());

		mv.setViewName("approval/selectCategory");
		return mv;
	}

	// ���� �ۼ� �� ��û
	@RequestMapping(value = "/writeApproval.do", method = RequestMethod.GET)
	public ModelAndView form(@RequestParam(required=false, defaultValue="0") int tmpNo ) {
		ModelAndView mv = new ModelAndView();
		if(tmpNo > 0) {
			mv.addObject("template",templateService.retrieveTemplate(tmpNo));
		}
		mv.setViewName("approval/writeApproval");
		return mv;
	}

	// ���� ���
	@RequestMapping(value = "/writeApproval.do", method = RequestMethod.POST)
	public String submit() {

		// ���� �ۼ� ���� ȣ��~~ ó��~~

		return "redirect:/approval/requestList";
	}

}
