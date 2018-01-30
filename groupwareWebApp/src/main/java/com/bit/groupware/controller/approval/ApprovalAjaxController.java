package com.bit.groupware.controller.approval;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.domain.approval.TemplateVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.approval.ApprovalService;

@Controller
public class ApprovalAjaxController {

	@Autowired
	private ApprovalService approvalService;
	
	@RequestMapping(value="/approvalAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public String approvalAjax(ApprovalVO approval, 
			TemplateVO template, 
			@RequestParam int receiverNo, 
			HttpSession session) {
		//approval => validDate, urgency, apprTitle, apprContent,  apprFinalStatus
		
		EmployeeVO employee = new EmployeeVO();
		employee.setEmpNo("2018-00011");
		
		approval.setEmployee(employee);
		approval.setTemplate(template);
		
		System.out.println(approval.toString());
		System.out.println("receiver : " + receiverNo);
		
		//파일 저장
		String root = session.getServletContext().getRealPath("/");
		String path = root + "resources/upload/approvalFile/";
		
		File dir = new File(path);
		if(!dir.isDirectory()) {
			dir.mkdir();
		}
		
		
//		approvalService.registerApproval(approval, receiverNo);
		approvalService.registerApproval(approval, 111111);
		return "aaa";
	}

}
