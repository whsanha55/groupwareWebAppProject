package com.bit.groupware.controller.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.bit.groupware.service.employee.CodeService;

@Controller
public class RejectController {
	
	@Autowired
	private ApprovalService approvalService;
	@Autowired
	private CodeService codeService;
	
	//승인 문서함 페이지 요청
	@RequestMapping(value="/approvalReject.do", method=RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv=new ModelAndView();
		mv.addObject("deptCodes", codeService.retrieveDeptCodeList());
		mv.setViewName("approval/rejectList");
		return mv;
	}
	
	
	
	//임시보관
		@RequestMapping(value="/approvalTemporary.do",method=RequestMethod.GET)
		public String temporaryApproval(@RequestParam(value="apprNo") int apprNo) {
			
			ApprovalVO approval=new ApprovalVO();
			approval.setApprNo(apprNo);
			approval.setApprFinalStatus(4); 
			approvalService.modifyApproval(approval);
			
	
			
			return "redirect:approvalReject.do";
		}
}
