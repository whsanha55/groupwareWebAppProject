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

import com.bit.groupware.domain.approval.ApprovalCommentVO;
import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.service.approval.ApprovalRecordService;
import com.bit.groupware.service.approval.ApprovalService;
import com.bit.groupware.service.employee.CodeService;

@Controller
public class ToDoController {
	private static final Logger logger= LoggerFactory.getLogger(ApprovalAjaxController.class);
	@Autowired
	private ApprovalService approvalService;
	@Autowired
	private CodeService codeService;
	@Autowired
	private ApprovalRecordService recordService;
	
	//대기문서함 페이지 요청
	@RequestMapping(value="/approvalTodo.do", method=RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv=new ModelAndView();
	
	//	mv.addObject("deptCodes", codeService.retrieveDeptCodeList());
		mv.setViewName("approval/toDoList");
		return mv;
	}
	
	
	
	
	//결재 보류 처리
	@RequestMapping(value="/postponeApproval.do",method=RequestMethod.GET)
	@ResponseBody
	public boolean approve(@RequestParam(value="apprNo") int apprNo) {
		ApprovalVO appr = approvalService.retrieveApproval(apprNo);
		appr.setApprFinalStatus(2); 
		approvalService.modifyApproval(appr);
		return true;
	}
	
	
	//결재 반려 처리
	@RequestMapping(value="/rejectApproval.do",method=RequestMethod.GET)
	@ResponseBody
	public boolean reject(@RequestParam(value="apprNo") int apprNo, 
			       @RequestParam(value="commentContent", required=false) String commentContent) {

		logger.info("=============content : {}", commentContent);
		
/*		ApprovalVO appr = approvalService.retrieveApproval(apprNo);
		appr.setApprFinalStatus(3); 
		
	appr.getApprovalRecords().
		
		if(commentContent != null) {
			ApprovalCommentVO comment = new ApprovalCommentVO();
			comment.setCommentContent(commentContent);
			comment.setApprovalRecord(approvalRecord);
		}
		
		recordService.
		
		approvalService.modifyApproval(appr); 

*/		
		return true;
	
	}
	
}
