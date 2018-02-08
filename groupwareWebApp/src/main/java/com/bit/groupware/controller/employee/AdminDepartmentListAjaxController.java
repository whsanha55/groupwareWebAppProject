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
public class AdminDepartmentListAjaxController {
	private static final Logger logger = LoggerFactory.getLogger(AdminDepartmentListAjaxController.class);
	
	@Autowired
	private EmployeeService employeeService;
/*
	@RequestMapping(value="/admin/departmentListSearchAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> form(
						@RequestParam(required=false) String keyfield,
						@RequestParam(required=false) String keyword
						) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
			
		List<DepartmentVO> departments = employeeService.retrieveDeputyRegisterEmployeeList(map);
		logger.info("departments : {}",departments);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("departments", departments);
		return returnMap;
	}*/
}
