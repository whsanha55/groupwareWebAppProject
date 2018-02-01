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

import com.bit.groupware.domain.employee.DeputyVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class DeputyRegisterSearchAjaxController {
	private static final Logger logger = LoggerFactory.getLogger(DeputyRegisterSearchAjaxController.class);
	
	@Autowired
	private EmployeeService employeeService;

	@RequestMapping(value="/deputyRegisterSearchAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> form(
						@RequestParam(required=false) String keyfield,
						@RequestParam(required=false) String keyword,
						@RequestParam int startRow,
						@RequestParam int endRow
						) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
			int totalCount = employeeService.retrieveDeputyRegisterCount(map);
		if(totalCount < endRow) {
			endRow = totalCount;
		}
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<EmployeeVO> employees = employeeService.retrieveDeputyRegisterEmployeeList(map);
		logger.info("employees : {}",employees);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("totalCount", totalCount);
		returnMap.put("employees", employees);
		return returnMap;
	}
	/*
	@RequestMapping(value="/registerDeputy.do", method=RequestMethod.POST)
	public int submit(
					@RequestParam String dempNo,
					@RequestParam String startDate,
					@RequestParam String endDate,
					@RequestParam String depReason,
					@RequestParam String empNo) {
		DeputyVO deputy = new DeputyVO(startDate, endDate, depReason, dempNo, empNo);
		employeeService.registerDeputy(deputy);
		return 1;
	}*/
}
