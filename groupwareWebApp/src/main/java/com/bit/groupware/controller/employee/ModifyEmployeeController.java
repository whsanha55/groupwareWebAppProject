package com.bit.groupware.controller.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.service.employee.EmployeeService;

@Controller
public class ModifyEmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/modifyEmployee.do", method=RequestMethod.GET)
	public ModelAndView detailEmployee()  {
		ModelAndView mv = new ModelAndView();
		String empNo = "2018-00018";
		mv.addObject("employee", employeeService.retrieveEmployee(empNo));
		mv.setViewName("employee/modifyEmployeeForm");
		return mv;
	}
}
