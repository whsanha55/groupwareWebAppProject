package com.bit.groupware.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrganizationChartController {

	
	@RequestMapping("/organizationChart.do")
	public String goOrganizationChart() {
		return "organizationChart";
	}
	
	
}
