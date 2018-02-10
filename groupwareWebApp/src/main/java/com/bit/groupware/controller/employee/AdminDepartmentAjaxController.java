package com.bit.groupware.controller.employee;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class AdminDepartmentAjaxController {
	private static final Logger logger = LoggerFactory.getLogger(AdminDepartmentAjaxController.class);
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/admin/deptListAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deptListAjaxController(@RequestParam("oldHead")String oldHead,
									   @RequestParam("newHead")String newHead) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("oldHead", oldHead);
		map.put("newHead", newHead);

		employeeService.modifyHead(map);
		
		return map;
		
	}
	
}
