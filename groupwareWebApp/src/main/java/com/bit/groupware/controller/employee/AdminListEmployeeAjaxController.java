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

import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class AdminListEmployeeAjaxController {
	private static final Logger logger = LoggerFactory.getLogger(AdminListEmployeeAjaxController.class);
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/admin/listEmployeeAjax.do", method=RequestMethod.POST)
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
		logger.info("keyfield : {}", keyfield);
		logger.info("keyword : {}", keyword);
		int totalCount = employeeService.retrieveEmployeeCount(map);
		if(totalCount < endRow) {
			endRow = totalCount;
		}
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<EmployeeVO> employees = employeeService.retrieveEmployeeList(map);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("totalCount", totalCount);
		returnMap.put("employees", employees);
		return returnMap;
		
		//"employee/admin_listEmployee";
	}
}
