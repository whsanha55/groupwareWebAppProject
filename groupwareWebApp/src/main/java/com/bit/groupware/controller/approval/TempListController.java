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
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.service.approval.ApprovalService;

@Controller
public class TempListController {
	private final static Logger logger=LoggerFactory.getLogger(TempListController.class);
	@Autowired
	private ApprovalService approvalService;

	// 임시보관함 페이지 요청
	@RequestMapping(value = "/approvalTemp.do", method = RequestMethod.GET)
	public String form() {

		return "approval/tempList";
	}
	
	//ajax 처리
	@RequestMapping(value="/approvalTempPaging.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> listTempApproval(
			@RequestParam(value="startRow") int startRow,
			@RequestParam(value="endRow") int endRow ){
		
		Map<String,Object> map=new HashMap<String,Object>();
		logger.info("startRow!!!!"+startRow);
		SecurityContext context=SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		UserVO user=(UserVO)authentication.getPrincipal();
		String id=user.getUsername();
		
		map.put("empNo", id);
		map.put("apprFinalStatus", 4);
		
		int totalCount =approvalService.retrieveApprovalCount(map);
		if(totalCount < endRow) {
			endRow=totalCount;
		}
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		Map<String,Object> returnMap=new HashMap<String,Object>();
		List<ApprovalVO> list=approvalService.retrieveApprovalList(map);
		logger.info("임시~"+list.size()); 
		returnMap.put("approvals",list );
		returnMap.put("totalCount", totalCount);
		
		return returnMap;
	}

}
