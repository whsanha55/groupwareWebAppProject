package com.bit.groupware.controller.approval;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

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
	@Autowired
	private ApprovalRecordService approvalRecordService;
	
	@RequestMapping(value="/approvalAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public int approvalAjax(ApprovalVO approval, 
			TemplateVO template, 
			@RequestParam int receiverNo, 
			HttpSession session) throws Exception {
		//approval => validDate, urgency, apprTitle, apprContent,  apprFinalStatus
		
		EmployeeVO employee = new EmployeeVO();
//		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		employee.setEmpNo(user.getUsername());
		employee.setEmpNo("2018-00011");
		
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
	
	//문서 상세조회
	@RequestMapping(value="/approvalDetail.do", method= RequestMethod.GET)
	public ModelAndView approvalDetail(@RequestParam(value="apprNo") int apprNo,
									   @RequestParam(value="status") int status) {
		
		ModelAndView mv =new ModelAndView();
		mv.addObject("status",status);
		//1:결재요청함 2:결재대기함 3:나머지
		mv.addObject("approval",approvalService.retrieveApproval(apprNo));
		mv.setViewName("approval/approvalDetail/pop");
		return mv;
	}
	
	//문서 현황 조회
	@RequestMapping(value="/approvalRecord.do",method=RequestMethod.GET)
	public ModelAndView approvalRecord(@RequestParam(value="apprNo") int apprNo) {
		ModelAndView mv = new ModelAndView();
		
		List<ApprovalRecordVO> list=approvalRecordService.retrieveApprovalRecordList(apprNo);

 		mv.addObject("records",list);
		mv.setViewName("approval/approvalRecord/pop"); 
		return mv;
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
