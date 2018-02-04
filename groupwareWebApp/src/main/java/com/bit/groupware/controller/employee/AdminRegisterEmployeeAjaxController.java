package com.bit.groupware.controller.employee;

import java.util.ArrayList;
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

import com.bit.groupware.domain.employee.CodeVO;
import com.bit.groupware.service.employee.CodeService;
import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class AdminRegisterEmployeeAjaxController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRegisterEmployeeAjaxController.class);
	
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private CodeService codeService;
	
	@RequestMapping(value="/admin/checkRelation.do", method=RequestMethod.POST)
	@ResponseBody
	public List<CodeVO> checkRelation(@RequestParam String deptCode) {
		return codeService.retrieveDeptCodeRelationList(deptCode);
	}
}











