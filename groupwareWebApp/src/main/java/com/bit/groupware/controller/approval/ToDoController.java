package com.bit.groupware.controller.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.service.approval.ApprovalService;
import com.bit.groupware.service.employee.CodeService;

@Controller
public class ToDoController {
	
	@Autowired
	private ApprovalService approvalService;
	@Autowired
	private CodeService codeService;
	
	
	//대기문서함 페이지 요청
	@RequestMapping(value="/approvalTodo.do", method=RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv=new ModelAndView();
	
	//	mv.addObject("deptCodes", codeService.retrieveDeptCodeList());
		mv.setViewName("approval/toDoList");
		return mv;
	}
	
	
	//데이터 & 페이지 처리
	@RequestMapping(value="/approvalTodoPaging.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> listRequestApproval(
			@RequestParam(value="keyfield",required=false) String keyfield ,
			@RequestParam(value="keyword",required=false) String keyword ,
			@RequestParam(value="keyword1",required=false) String keyword1 ,
			@RequestParam(value="startRow") int startRow ,
			@RequestParam(value="endRow") int endRow){
		
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		SecurityContext context=SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		UserVO user=(UserVO)authentication.getPrincipal();
		String id=user.getUsername();
		
		map.put("linempNo", id);
		map.put("apprFinalStatus", 0);
		map.put("apprStatus", 0);
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);	
		map.put("keyword1", keyword1);

		int totalCount = approvalService.retrieveApprovalCount(map);
		if(totalCount < endRow) {
			endRow = totalCount;
		}
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<ApprovalVO> approvals = approvalService.retrieveApprovalList(map);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("totalCount", totalCount);
		returnMap.put("approvals", approvals);
		
		return returnMap;
		
	}
	
	
	//결재 보류 처리
	@RequestMapping(value="/postponeApproval.do",method=RequestMethod.GET)
	@ResponseBody
	public boolean approve(@RequestParam(value="apprNo") int apprNo) {
		ApprovalVO appr=new ApprovalVO();
		appr=approvalService.retrieveApproval(apprNo);
		appr.setApprFinalStatus(2); 
		approvalService.modifyApproval(appr);
		return true;
	}
	
	
	
	
}
