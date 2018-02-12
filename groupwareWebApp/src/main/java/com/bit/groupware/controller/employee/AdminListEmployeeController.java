package com.bit.groupware.controller.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.service.employee.CodeService;

@Controller
public class AdminListEmployeeController {

	@Autowired
	private CodeService codeService;
	
	@RequestMapping(value="/admin/listEmployee.do", method=RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("deptCodes", codeService.retrieveDeptCodeList());
		mv.addObject("dutyCodes", codeService.retrieveDutyCodeList());
		mv.setViewName("employee/admin_listEmployee");
		return mv;
	}

}
