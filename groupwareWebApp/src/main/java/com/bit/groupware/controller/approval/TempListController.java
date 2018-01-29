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
public class TempListController {
	
	@Autowired
	private ApprovalService approvalService;

	// 임시보관함 페이지 요청
	@RequestMapping(value = "/approvalTemp.do", method = RequestMethod.GET)
	public ModelAndView form() {

		ModelAndView mv = new ModelAndView();

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("apprFinalStatus", 4);

		mv.addObject("approvals", approvalService.retrieveApprovalList(map));
		return mv;
	}

}
