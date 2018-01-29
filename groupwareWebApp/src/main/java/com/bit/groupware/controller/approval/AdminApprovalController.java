package com.bit.groupware.controller.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminApprovalController {

//	@Autowired
//	private 
	
	@RequestMapping(value="/admin/approval.do", method=RequestMethod.GET)
	public String approvalList() {
		return "approval/admin_approvalList";
	}
}
