package com.bit.groupware.controller.employee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmployeeSSNCheckController {
	
	@RequestMapping(value="/checkssn.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean ssnCheck(@RequestParam("ssn")String ssn) {
				
		int[] num = {2,3,4,5,6,7,0,8,9,2,3,4,5};
	
		int total = 0;
		for (int i = 0 ; i < ssn.length() -1 ; i++ ) {
			total += (ssn.charAt(i)-48) * num[i];
		}
		
		int result = 11-(total%11);
		if (result >= 10) {
			result -= 10;		
		}
	
		if (result != ssn.charAt(ssn.length()-1)-48) {
			return false;
		}
		return true;
	}
}
