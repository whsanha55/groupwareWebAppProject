package com.bit.groupware.controller.approval;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
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
	public boolean approvalAjax(ApprovalVO approval, TemplateVO template, int receiverNo) {
		//tmpNo 는 Template.tmpNo 에 바인딩
		EmployeeVO employee = new EmployeeVO();
		employee.setEmpNo("2018-00011");
		approval.setEmployee(employee);
		approval.setTemplate(template);
//		approvalService.registerApproval(approval, receiverNo);
		approvalService.registerApproval(approval, 111111);
		return true;
	}
}
