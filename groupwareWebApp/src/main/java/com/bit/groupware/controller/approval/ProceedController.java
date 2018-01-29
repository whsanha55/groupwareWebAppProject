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
public class ProceedController {
	
	@Autowired
	private ApprovalService approvalService;
	
	//결재 진행함 페이지 요청
	@RequestMapping(value="/approvalProceed.do", method=RequestMethod.GET)
	public ModelAndView form() {
		
		//결재진행함  - 번호, 카테고리 구분, 제목, 기안자, 기안부서, 기안일, 상태 정보를 가지고 이동
		
		ModelAndView mv = new ModelAndView();
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("apprFinalStatus", 0);
			
		mv.addObject("approvals", approvalService.retrieveApprovalList(map));
		return mv;
	}

}
