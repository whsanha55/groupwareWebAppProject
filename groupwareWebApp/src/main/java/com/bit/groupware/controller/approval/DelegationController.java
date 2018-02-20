package com.bit.groupware.controller.approval;

import java.util.HashMap;
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

import com.bit.groupware.domain.approval.DelegationVO;
import com.bit.groupware.service.approval.DelegationService;
import com.bit.groupware.service.approval.TemplateService;
import com.bit.groupware.service.employee.CodeService;

@Controller
public class DelegationController {
	private final static Logger logger=LoggerFactory.getLogger(DelegationController.class);
	@Autowired
	private CodeService codeService;
	@Autowired
	private TemplateService templateService;
	@Autowired
	private DelegationService delegationService;
	
	//페이지 요청
	@RequestMapping(value="/admin/delegation.do",method=RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv= new ModelAndView();
		mv.addObject("duty",codeService.retrieveDutyCodeList());
		mv.addObject("template",templateService.retrieveTemplateNameList());
		mv.setViewName("approval/admin_insertDelegation");
		return mv;
	}
	
	//테이블 페이징
	@RequestMapping(value="/admin/delegationPaging.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> listRequestApproval(
			@RequestParam(value="keyfield",required=false) String keyfield ,
			@RequestParam(value="keyword",required=false) String keyword ,
			@RequestParam(value="startRow") int startRow ,
			@RequestParam(value="endRow") int endRow) {
		
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);	
		
		int totalCount=delegationService.retrieveDelegationsCount(map);
		
		if(totalCount < endRow) {
			endRow = totalCount;
		}
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();

		returnMap.put("delegations", delegationService.retrieveDelegations(map));
		returnMap.put("totalCount", totalCount);
		return returnMap;
		
	}
	
	//전결 등록 전에 기존에 양식서가 등록된 상태인지 확인하는 메소드
	@RequestMapping(value="/admin/checkDelegationIsTmpExist.do",method=RequestMethod.GET)
	@ResponseBody
	public boolean checkDelegationIsTmpExist(@RequestParam(value="tmpNo") int tmpNo) {
		
		return delegationService.retreiveDelegationIsTmpExist(tmpNo) > 0 ? true : false; 
		

	}
	
	//전결 추가
	@RequestMapping(value="/admin/registerDelegation.do",method=RequestMethod.POST)
	@ResponseBody
	public String registerDele(@RequestParam(value="tmpNo") int tmpNo,
							   @RequestParam(value="cNo") String cNo) {
		Map<String,Object> map=new HashMap<String ,Object>();
		map.put("tmpNo", tmpNo);
		map.put("cNo", cNo);
		
		delegationService.registerDelegationList(map); 
		
		return "완료";
	}
	
	//전결 삭제
	@RequestMapping(value="/admin/removeDelegation.do", method=RequestMethod.GET) 
	public String removeDele(@RequestParam(value="deleNo") int deleNo) {
		delegationService.modifyDelegationDelete(deleNo); 
		return "redirect:/admin/delegation.do";
	}
}
