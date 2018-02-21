package com.bit.groupware.controller.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.approval.TemplateCategoryVO;
import com.bit.groupware.service.approval.TemplateCategoryService;

@Controller
public class TemplateCategoryAjaxController {
	
	@Autowired
	private TemplateCategoryService categoryService;

	//카테고리 등록 요청
	@RequestMapping(value="/admin/registerCategory.do", method=RequestMethod.POST)
	@ResponseBody
	public List<TemplateCategoryVO> plus(TemplateCategoryVO templateCategoryVO) {
		categoryService.registerTemplaeCategory(templateCategoryVO);
		return categoryService.retrieveTemplateCategoryList();
	}
	
	
	//카테고리 미사용 요청
	@RequestMapping(value="/admin/removeCategory.do", method=RequestMethod.GET)
	@ResponseBody
	public List<TemplateCategoryVO> minus(@RequestParam(value="categoryNo", required=true)int categoryNo) {
		categoryService.modifyTemplateCategory(categoryNo);
		return categoryService.retrieveTemplateCategoryList();
	}
	
	
	//카테고리 내 사용 양식 카운트
	@RequestMapping(value="/admin/countCategory.do", method=RequestMethod.GET)
	@ResponseBody
	public int count(@RequestParam(value="categoryNo", required=true)int categoryNo) {
		return categoryService.retrieveCategoryCount(categoryNo);
	}
	
	
}
