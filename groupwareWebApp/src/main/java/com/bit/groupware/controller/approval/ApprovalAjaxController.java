package com.bit.groupware.controller.approval;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.approval.ApprovalFileVO;
import com.bit.groupware.domain.approval.ApprovalRecordVO;
import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.domain.approval.TemplateVO;
import com.bit.groupware.domain.employee.EmployeeVO;

import com.bit.groupware.service.approval.ApprovalRecordService;
import com.bit.groupware.service.approval.ApprovalService;
import com.bit.groupware.util.UploadApprovalFiles;

@Controller
public class ApprovalAjaxController {
	private static final Logger logger= LoggerFactory.getLogger(ApprovalAjaxController.class);
	
	@Autowired
	private ApprovalService approvalService;

	
	@RequestMapping(value="/approvalAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public int approvalAjax(ApprovalVO approval, 
			TemplateVO template, 
			@RequestParam int receiverNo, 
			HttpSession session, 
			Principal principal) throws Exception {
		//approval => validDate, urgency, apprTitle, apprContent,  apprFinalStatus
		
		EmployeeVO employee = new EmployeeVO();
		employee.setEmpNo(principal.getName());
		
		approval.setEmployee(employee);
		approval.setTemplate(template);
		
		
		//파일 저장
		for(MultipartFile file : approval.getUpload()) {
			if(!file.isEmpty()) {
				ApprovalFileVO approvalFile = UploadApprovalFiles.uploadFile(file, session.getServletContext());
				approval.addApprovalFile(approvalFile);
			}
		}
		
		approvalService.registerApproval(approval, receiverNo);
		
		return approval.getApprFinalStatus();
	}
	
	
	//결재 회수 처리
	@RequestMapping(value="/returnApproval.do",method=RequestMethod.GET)
	@ResponseBody
	public boolean returnApproval(@RequestParam(value="apprNo") int apprNo) {
		
		ApprovalVO appr=new ApprovalVO();
		appr.setApprNo(apprNo);
		appr.setApprFinalStatus(4); 
		approvalService.modifyApproval(appr); 
		appr=approvalService.retrieveApproval(apprNo);
		return true;
		
	}
}
