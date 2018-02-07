package com.bit.groupware.controller.employee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminPlanMapController {

	@RequestMapping("/admin/map.do")
	public String mapController() {
		return "employee/map";
	}
}
