package com.bit.groupware.controller.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.PlanVO;
import com.bit.groupware.service.employee.PlanService;

@Controller
public class AdminListPlanController {
	private static final Logger logger = LoggerFactory.getLogger(AdminListPlanController.class);
	
	@Autowired
	private PlanService planService;
	
	//일정 목록 조회 요청
	@RequestMapping(value="/admin/listPlan.do")
	public ModelAndView listPlan() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", "제목");
		map.put("keyword", "뿌잉");
		logger.info("map : {}", map);
		mv.addObject("plans", planService.retrievePlanList(map));
		mv.setViewName("employee/admin_listPlan");
		return mv;
	}
	
	//일정 목록 검색
	@RequestMapping(value="/admin/listPlanAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> form1(
			@RequestParam(required=false) String keyfield,
			@RequestParam(required=false) String keyword
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		List<PlanVO> plans = planService.retrievePlanList(map);
		int totalCount = plans.size();
		map.put("totalCount", totalCount);
		logger.info("map : {}", map);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("plans", plans);
		logger.info("returnMap : {}", returnMap);
		return returnMap;
	}

}
