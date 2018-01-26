package com.bit.groupware.controller.employee;

import java.util.Map;

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
public class AdminListPlanController {
	private static final Logger logger = LoggerFactory.getLogger(AdminListPlanController.class);
	
	@Autowired
	private PlanService planService;
	
	//일정 목록 조회 요청
	@RequestMapping(value="/admin/listPlan.do", method=RequestMethod.GET)
	public ModelAndView listPlan(@RequestParam(value="map") Map<String, Object> map) {
		logger.info("map : {}", map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("plans", planService.retrievePlanList(map));
		mv.setViewName("admin_listPlan");
		return mv;
	}

}
