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

@Controller
public class FinishController {
	
	@Autowired
	private ApprovalService approvalService;
	
	//승인 문서함 페이지 요청
	@RequestMapping(value="/approvalFinish.do", method=RequestMethod.GET)
	public String form() {
		
		return "approval/finishList";
	}
	
	@RequestMapping(value="/approvalFinishPaging.do",method=RequestMethod.POST) 
	@ResponseBody
	public Map<String,Object> listProceedApproval(
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
		
		map.put("empNo", id);
		map.put("apprFinalStatus", 1);
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);	
		map.put("keyword1", keyword1);
		
	
 
		int totalCount = approvalService.retrieveAllApprovalCount(map);
		if(totalCount < endRow) {
			endRow = totalCount;
		}
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		
		List<ApprovalVO> approvals = approvalService.retrieveAllApprovalList(map); 
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("totalCount", totalCount);
		returnMap.put("approvals", approvals);
		return returnMap;
		
	}
}
