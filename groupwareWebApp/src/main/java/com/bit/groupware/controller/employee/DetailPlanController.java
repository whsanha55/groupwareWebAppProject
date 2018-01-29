package com.bit.groupware.controller.employee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.service.employee.PlanService;

@Controller
public class DetailPlanController {
	private static final Logger logger = LoggerFactory.getLogger(DetailPlanController.class);
	
	@Autowired
	private PlanService planService;
	
	//일정 상세 조회
	@RequestMapping(value="/detailPlan.do", method=RequestMethod.GET)
	public ModelAndView detailPlan(@RequestParam(value="pNo") String pNo) {
		logger.info("pNo : ", pNo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("plan", planService.retrievePlan(pNo));
		mv.setViewName("employee/detailPlan");
		return mv;
	}
}
