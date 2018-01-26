package com.bit.groupware.controller.approval;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	//���� �ۼ� - ��� ����
	@RequestMapping(value="/selectCategory.do", method=RequestMethod.GET)
	public ModelAndView category() {
		ModelAndView mv = new ModelAndView();

		//ī�װ� ����Ʈ
		mv.addObject("categoryList",categoryService.retrieveTemplateCategoryList());
		
		//��ļ� ����Ʈ
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", new Integer(1));
		map.put("endRow", 10);
		mv.addObject("templateList",templateService.retrieveTemplateList(map));
		
		mv.setViewName("approval/selectCategory");
		return mv;
	}
	
	//���� �ۼ� �� ��û
	@RequestMapping(value="/writeApproval.do", method=RequestMethod.GET) 
	public String form() {
		return "approval/writeApproval";
	}
	
	//���� ���
	@RequestMapping(value="/writeApproval.do", method=RequestMethod.POST)
	public String submit() {

		//���� �ۼ� ���� ȣ��~~ ó��~~
		
		return "redirect:/approval/requestList";
	}


}
