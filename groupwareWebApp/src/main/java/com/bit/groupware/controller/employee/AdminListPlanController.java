package com.bit.groupware.controller.employee;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	public List<Map<String, Object>> form1(
			@RequestParam(required=false) String keyfield,
			@RequestParam(required=false) String keyword ,
			HttpServletRequest req
			) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		List<PlanVO> plans = planService.retrievePlanList(map);
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for(PlanVO plan : plans) {
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("id", plan.getpNo());
			switch (plan.getpImpt()) {
				case 1:
					map1.put("color","#47b747" );
					map1.put("textColor", "white");
					break;
				case 2:
					map1.put("color","#3a87ad");
					map1.put("textColor", "white");
					break;
				case 3:
					map1.put("color","#fb4b4b" );
					map1.put("textColor", "white");
					break;
			}
			
			if(plan.getcName().equals("부서")) {
				map1.put("title", plan.getpTitle() + " - 전체");
			} else {
				map1.put("title", plan.getpTitle() + " - " + plan.getcName());
			}
			
			map1.put("start", plan.getStartDate());
			map1.put("end", plan.getEndDate());
			map1.put("url", req.getContextPath()+ "/admin/detailPlan.do?pNo="+plan.getpNo());
			list.add(map1);
			
			
		
		}
		return list;
	}

}
