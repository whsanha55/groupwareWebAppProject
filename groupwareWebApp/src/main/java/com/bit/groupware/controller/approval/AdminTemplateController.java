package com.bit.groupware.controller.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.approval.TemplateCategoryVO;
import com.bit.groupware.domain.approval.TemplateVO;
import com.bit.groupware.service.approval.TemplateCategoryService;
import com.bit.groupware.service.approval.TemplateService;


@Controller
public class AdminTemplateController {

	private final static Logger logger = LoggerFactory.getLogger(AdminTemplateController.class);
	
	@Autowired
	private TemplateService service;
	
	@Autowired
	private TemplateCategoryService categoryService;

	
	
	//양식관리 폼 요청: 전체 리스트
	@RequestMapping(value="/admin/template.do", method=RequestMethod.GET)
	public ModelAndView templateList() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", 1);
		map.put("endRow", 10);
		mv.addObject("templates", service.retrieveTemplateList(map));
		mv.setViewName("approval/admin_templateList");
		return mv;
	}
	
/*	
	//양식관리 검색 요청
	@RequestMapping(value="/admin/findTemplate.do")
	public ModelAndView find(@RequestParam(value="keyfield", required=true)String keyfield, 
									 @RequestParam(value="keyword")String keyword) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("startRow", 1);
		map.put("endRow", 10);
		mv.addObject("templates", service.retrieveTemplateList(map));
		mv.setViewName("approval/admin_templateList");
		return mv;
	}*/
	
	
	/*
	//양식 상세보기
	@RequestMapping(value="/admin/template.do")
	public ModelAndView detail(@RequestParam(value="tmpNo", required=true)int tmpNo) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("template", service.retrieveTemplate(tmpNo));
		mv.setViewName("approval/admin_detailTemplate");
		return mv;
	} */
	
	
	
	//양식 등록 폼 요청
	@RequestMapping(value="/admin/addTemplateForm.do", method=RequestMethod.GET)
	public ModelAndView addForm() {		
		ModelAndView mv = new ModelAndView();
		mv.addObject("categories", categoryService.retrieveTemplateCategoryList());
		mv.setViewName("approval/admin_addTemplate");
		return mv;
	}
	
	
	
	//양식 등록 요청
	@RequestMapping(value="/admin/registerTemplate.do", method=RequestMethod.POST)
	@ResponseBody
	public String register(TemplateVO templateVO, TemplateCategoryVO templateCategoryVO) {
		templateVO.setTemplateCategory(templateCategoryVO);
		service.registerTemplate(templateVO);
		return "등록 완료";
	} 
	
	
	
	//양식 삭제 요청
	@RequestMapping(value="/admin/removeTemplate.do", method=RequestMethod.POST)
	@ResponseBody
	public String remove(@RequestParam(value="tmpNo", required=true)String tmpNos) {		
		String[] values = tmpNos.split(",");
		
		int[] nums = new int[values.length];
		
		for(int i=0; i<values.length; i++) {
			nums[i] = Integer.parseInt(values[i]);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
				
		map.put("tmpNos", nums);
		
		service.removeTemplate(map);
		return "삭제 완료";			
	}
		
	
	
	//카테고리 등록 요청
	@RequestMapping(value="/admin/registerCategory.do", method=RequestMethod.POST)
	@ResponseBody
	public List<TemplateCategoryVO> plus(TemplateCategoryVO templateCategoryVO) {
		categoryService.registerTemplaeCategory(templateCategoryVO);
		return categoryService.retrieveTemplateCategoryList();
	}
	
	
	
	//카테고리 삭제 요청
	@RequestMapping(value="/admin/removeCategory.do", method=RequestMethod.GET)
	@ResponseBody
	public List<TemplateCategoryVO> minus(@RequestParam(value="categoryNo", required=true)int categoryNo) {
		categoryService.removeTemplateCategory(categoryNo);
		return categoryService.retrieveTemplateCategoryList();
	}
	
}
