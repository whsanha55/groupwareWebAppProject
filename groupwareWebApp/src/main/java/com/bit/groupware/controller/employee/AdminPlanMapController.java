package com.bit.groupware.controller.employee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminPlanMapController {

	@RequestMapping("/mapbase.do")
	public String form() {
		return "employee/mapbase";
	}
	@RequestMapping("/admin/map.do")
	public String mapController() {
		return "map";
	}
}
