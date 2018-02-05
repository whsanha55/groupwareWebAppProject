package com.bit.groupware.controller.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.service.approval.ApprovalService;

@Controller
public class RefController {
		private final static Logger logger=LoggerFactory.getLogger(RefController.class);
		@Autowired
		private ApprovalService approvalService; 

		//참조 문서함 페이지 요청
		@RequestMapping(value="/approvalRef.do", method=RequestMethod.GET)
		public String form() {
			
			return "approval/refList";
		}
		
		@RequestMapping(value="/approvalRefPaging.do",method=RequestMethod.POST) 
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
			
			map.put("linempNo", id);
			map.put("apprFinalStatus", 0);
			map.put("apprStatus", 6);
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
			
		/*	for(ApprovalVO appr: approvals) { 
				if(appr.getApprovalRecords().get(0).getCheckDate()!=null) {
					appr.
					//logger.info("체크확인1 :"+returnMap.get("check"));
				}else if(appr.getApprovalRecords().get(0).getCheckDate()==null){
					returnMap.put("check", 2);
					//logger.info("체크확인2 : "+returnMap.get("check"));
				}
			}*/
			
			returnMap.put("totalCount", totalCount);
			returnMap.put("approvals", approvals);
			return returnMap;
			
		}

	
}
