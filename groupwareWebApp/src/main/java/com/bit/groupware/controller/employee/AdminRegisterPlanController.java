package com.bit.groupware.controller.employee;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.groupware.domain.employee.PlanVO;
import com.bit.groupware.service.employee.PlanService;

@Controller
public class AdminRegisterPlanController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRegisterPlanController.class);
	@Autowired
	private PlanService planService;
	
	//일정 추가 폼 요청
	@RequestMapping(value="/admin/registerPlan.do", method=RequestMethod.GET)
	public String form() {
		return "일정추가폼";
	}
	
	//일정 추가 요청
	@RequestMapping(value="/admin/registerPlan.do", method=RequestMethod.POST)
	public String submit(PlanVO plan, HttpSession session) throws Exception {
		logger.info("plan : ", plan);
		planService.registerPlan(plan);
		return "redirect:/admin/listPlan.do";
	}
}
