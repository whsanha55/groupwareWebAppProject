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

import com.bit.groupware.domain.approval.ApprovalRecordVO;
import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.service.approval.ApprovalRecordService;
import com.bit.groupware.service.approval.ApprovalService;

@Controller
public class MyRequestController {
	private static final Logger logger=LoggerFactory.getLogger(MyRequestController.class);
	@Autowired
	private ApprovalService approvalService;
	@Autowired
	private ApprovalRecordService approvalRecordService;
		
	//결재 요청함 페이지 요청
	@RequestMapping(value="/approvalMyRequest.do", method=RequestMethod.GET)
	public String form() {
		
		return "approval/myRequestList";
	}
	

	
	//결재 현황 모달 처리
	@RequestMapping(value="/recordModal.do",method=RequestMethod.GET)
	public ModelAndView currentRecord(@RequestParam(value="apprNo") int apprNo){
		List<ApprovalRecordVO> list=approvalRecordService.retrieveApprovalRecordList(apprNo);
		ModelAndView mv=new ModelAndView();
		mv.addObject("records",list);
		mv.setViewName("approval/approvalRecord"); 
		return mv;
	}

}