package com.bit.groupware.controller.authority;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadFileController {
	
	@RequestMapping(value="/downloadFile.do", method=RequestMethod.GET)
	public ModelAndView downloadFile(
		@RequestParam("originalFileName") String originalFileName,
		@RequestParam("systemFileName") String systemFileName )  {
		ModelAndView mv = new ModelAndView();
		mv.addObject("originalFileName", originalFileName);
		mv.addObject("systemFileName", systemFileName);
		mv.setViewName("downloadFileView");
		return mv;
	}

}
