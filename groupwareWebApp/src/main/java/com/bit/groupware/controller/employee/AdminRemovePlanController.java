package com.bit.groupware.controller.employee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.groupware.service.employee.PlanService;

@Controller
public class AdminRemovePlanController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRemovePlanController.class);
	
	@Autowired
	private PlanService planService;
	
	//일정 삭제 요청
	@RequestMapping(value="/admin/removePlan.do")
	public String submit(@RequestParam(value="pNo", required=true) String pNo) {
		logger.info("pNo : ", pNo);
		planService.removePlan(pNo);
		return "redirect:/admin/listPlan.do";
	}
}
