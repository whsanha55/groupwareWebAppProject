package com.bit.groupware.controller.approval;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.service.approval.ApprovalService;

@Controller
public class RefController {
	
	@Autowired
	private ApprovalService apprService;

	//참조 문서함 페이지 요청 -- 회수
	@RequestMapping(value="/approvalRef.do", method=RequestMethod.GET)
	public ModelAndView form() {
		
		ModelAndView mv = new ModelAndView();
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("apprFinalStatus", 0);
		map.put("empNo", "2018-00011");
		mv.addObject("approvals", apprService.retrieveApprovalList(map));
		mv.setViewName("approval/finishList");
		
		return mv; 
		
		
		
	}
	
}
