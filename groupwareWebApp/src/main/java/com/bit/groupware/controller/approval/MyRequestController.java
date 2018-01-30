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
public class MyRequestController {
	@Autowired
	private ApprovalService approvalService;
	//결재 요청함 페이지 요청
	@RequestMapping(value="/approvalMyRequest.do", method=RequestMethod.GET)
	public ModelAndView listRequestApproval() {
		
		ModelAndView mv=new ModelAndView();
		Map<String,Object> map=new HashMap<String,Object>();
		
		map.put("empNo", "2018-00011");
		map.put("apprFinalStatus", 0);
		mv.addObject("approvals",approvalService.retrieveApprovalList(map) );
		mv.setViewName("approval/myRequestList");
		return mv; 
		
		// ** 결재상태에 따라 데이터가 다르게 나오니까 그것만 넘겨주면.. ? 
		
	}
}
