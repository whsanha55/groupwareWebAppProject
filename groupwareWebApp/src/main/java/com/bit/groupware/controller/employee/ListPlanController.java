package com.bit.groupware.controller.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.domain.employee.PlanVO;
import com.bit.groupware.service.employee.PlanService;

@Controller
public class ListPlanController {
	private static final Logger logger = LoggerFactory.getLogger(ListPlanController.class);
	
	@Autowired
	private PlanService planService;
	
	//���� ��� ��ȸ ��û
	@RequestMapping(value="/listPlan.do", method=RequestMethod.GET)
	public ModelAndView listPlan() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		UserVO user = (UserVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		map.put("cName", user.getDeptName());
		map.put("keyfield", "pTitle");
		map.put("keyword", "����1");
		logger.info("map : {}", map);
		List<PlanVO> plans = planService.retrievePlanListByDeptName(map);
		mv.addObject("plans",plans);
		mv.setViewName("employee/listPlan");
		return mv;
	}
	
	//��� ���� ��� ��ȸ ��û
	@RequestMapping(value="/listPlanAll.do", method=RequestMethod.GET)
	public ModelAndView listPlan2() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", "pTitle");
		map.put("keyword", "����1");
		logger.info("map : {}", map);
		mv.addObject("plans", planService.retrievePlanList(map));
		mv.setViewName("employee/listPlanAll");
		return mv;
	}
	

}
