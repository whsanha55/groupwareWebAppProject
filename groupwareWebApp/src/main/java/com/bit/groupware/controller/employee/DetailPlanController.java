package com.bit.groupware.controller.employee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.PlanVO;
import com.bit.groupware.service.employee.PlanService;

@Controller
public class DetailPlanController {
	private static final Logger logger = LoggerFactory.getLogger(DetailPlanController.class);
	
	@Autowired
	private PlanService planService;
	
	//일정 상세 조회
	@RequestMapping(value="/detailPlan.do", method=RequestMethod.GET)
	public ModelAndView detailPlan(@RequestParam(value="pNo") String pNo) {
		logger.info("pNo : {} ", pNo);
		ModelAndView mv = new ModelAndView();
		PlanVO plan = planService.retrievePlan(pNo);
		plan.setpContent(plan.getpContent().replaceAll("\n", "<br>"));
		mv.addObject("plan",plan );
		mv.setViewName("employee/detailPlan");
		return mv;
	}
	
	//일정 상세 조회
	@RequestMapping(value="/admin/detailPlan.do", method=RequestMethod.GET)
	public ModelAndView detailPlan2(@RequestParam(value="pNo") String pNo) {
		logger.info("pNo : {} ", pNo);
		ModelAndView mv = new ModelAndView();
		PlanVO plan = planService.retrievePlan(pNo);
		plan.setpContent(plan.getpContent().replaceAll("\n", "<br>"));
		mv.addObject("plan",plan );
		mv.setViewName("employee/admin_detailPlan");
		return mv;
	}
}
