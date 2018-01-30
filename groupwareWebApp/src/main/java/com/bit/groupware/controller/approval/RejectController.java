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
public class RejectController {
	
	@Autowired
	private ApprovalService approvalService;

	// 반려문서함 페이지 요청
	@RequestMapping(value = "/approvalReject.do", method = RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("empNo", "2018-00011");
		map.put("keyfield", "empName");
		map.put("keyword", "원정우");

		map.put("apprFinalStatus", 3);
		mv.addObject("approvals", approvalService.retrieveApprovalList(map));

		return mv;
	}
}
