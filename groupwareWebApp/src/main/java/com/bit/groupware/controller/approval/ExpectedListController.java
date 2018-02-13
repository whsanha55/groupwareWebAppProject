package com.bit.groupware.controller.approval;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.groupware.service.approval.ApprovalRecordService;
import com.bit.groupware.service.approval.ApprovalService;
@Controller
public class ExpectedListController {
	
	private static final Logger logger=LoggerFactory.getLogger(ExpectedListController.class);
	@Autowired
	private ApprovalService approvalService;
	@Autowired
	private ApprovalRecordService approvalRecordService;
		
	//결재 요청함 페이지 요청
	@RequestMapping(value="/approvalExpect.do", method=RequestMethod.GET)
	public String form() {   		
		return "approval/expectedList";
	}   
}
