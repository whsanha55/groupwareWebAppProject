package com.bit.groupware.controller.authority;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.service.authority.NoticeService;

@Controller
public class DetailNoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/detailNotice.do", method=RequestMethod.GET)
	public ModelAndView form(@RequestParam(value="noticeNo") int noticeNo) {
		System.out.println("�ѹ�!!!!!!!!!!!!!!!!!!!"+noticeNo);
		ModelAndView mv = new ModelAndView();
		
		noticeService.upHitCount(noticeNo);
		mv.addObject("notice", noticeService.retrieveNotice(noticeNo));
		mv.setViewName("authority/detailNotice");
		return mv;	
	}
}
