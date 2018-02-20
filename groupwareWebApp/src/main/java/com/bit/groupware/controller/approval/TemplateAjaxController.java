package com.bit.groupware.controller.approval;

import java.security.Principal;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.approval.TemplateCategoryVO;
import com.bit.groupware.domain.approval.TemplateVO;
import com.bit.groupware.service.approval.TemplateService;

@Controller
public class TemplateAjaxController {
	private final static Logger logger = LoggerFactory.getLogger(TemplateAjaxController.class);
	@Autowired
	private TemplateService templateService;
	
	@RequestMapping(value = "/templatePagingAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getTemplateList(
			@RequestParam(required=false) String keyfield,
			@RequestParam(required=false) String keyword ,
			@RequestParam(required=false) String keyword1 ,
			@RequestParam(required=false,defaultValue="false") boolean isAdmin,
			@RequestParam int startRow ,
			@RequestParam int endRow ,
			Principal principal
			) {
		Map<String, Object> map = new HashMap<String, Object>();

		if(!isAdmin) {
		map.put("empNo", principal.getName());		
		}
		
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("keyword1", keyword1);
			
		int totalCount = templateService.retrieveTemplateCount(map);
		if(totalCount < endRow) {
			endRow = totalCount;				
		}
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<TemplateVO> templates = templateService.retrieveTemplateList(map);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("totalCount", totalCount);
		returnMap.put("templates", templates);
		return returnMap;
	}
	
	
	//양식 등록 요청
	@RequestMapping(value="/admin/registerTemplate.do", method=RequestMethod.POST)
	@ResponseBody
	public String register(TemplateVO templateVO, TemplateCategoryVO templateCategoryVO) {
		templateVO.setTemplateCategory(templateCategoryVO);
		templateService.registerTemplate(templateVO);
		
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
		
		templateService.updateTemplateUsing(map);
		return "삭제 완료";			
	}
	
	
	//양식 사용여부 변경
	@RequestMapping(value="/admin/updateTmpUsing.do", method=RequestMethod.GET)
	@ResponseBody
	public String updateTmpUsing(@RequestParam(value="tmpNo", required=true)int tmpNo, 
								 @RequestParam(value="tmpUsing", required=true)int tmpUsing) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tmpNo", tmpNo);
		map.put("tmpUsing", tmpUsing);
		
		templateService.updateTemplateUsing(map);
		
		return "변경 완료";
	}
	
	
	
	//자동완성에 필요한 양식서 목록들
	@RequestMapping(value = "/retrieveTemplateNameList.do", method = RequestMethod.GET)
	@ResponseBody
	public Set<String> retrieveTemplateNameList() {
		List<TemplateVO> templates = templateService.retrieveTemplateNameList();
		Set<String> set = new HashSet<String>();
		for(TemplateVO template : templates) {
			set.add(template.getTmpName());
		}
		return set;
	}
		
	
	//카테고리번호에 해당하는 양식서 조회
	@RequestMapping(value="/admin/retrieveTemplateList.do", method=RequestMethod.GET)
	@ResponseBody
	public List<TemplateVO> retrieveTemplateList(@RequestParam(value="categoryNo") int categoryNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("categoryNo", categoryNo);
		return templateService.retrieveTemplateListByCategoryNo(map);
	} 
	
}
