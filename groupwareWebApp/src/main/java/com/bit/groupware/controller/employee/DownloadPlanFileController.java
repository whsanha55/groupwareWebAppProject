package com.bit.groupware.controller.employee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadPlanFileController {
	
	@RequestMapping(value="/downloadPlanFile.do", method=RequestMethod.GET)
	public ModelAndView downloadFile(
		@RequestParam("fileName") String fileName,
		@RequestParam("systemFileName") String systemFileName )  {
		ModelAndView mv = new ModelAndView();
		mv.addObject("fileName", fileName);
		mv.addObject("systemFileName", systemFileName);
		mv.setViewName("downloadPlanFileView");
		return mv;
	}

}
