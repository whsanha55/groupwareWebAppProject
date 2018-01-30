package com.bit.groupware.controller.employee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.EmployeeVO;

@Controller
public class ModifyEmployeeController {

	@RequestMapping(value="/modifyEmployee.do", method=RequestMethod.GET)
	public ModelAndView detailEmployee(EmployeeVO employee)  {
		ModelAndView mv = new ModelAndView();
		mv.addObject("employee", employee);
		mv.setViewName("/employee/modifyEmployeeForm.jsp");
		return mv;
	}
}
