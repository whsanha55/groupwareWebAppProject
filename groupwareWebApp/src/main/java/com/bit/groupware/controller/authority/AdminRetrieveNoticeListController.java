package com.bit.groupware.controller.authority;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.service.authority.NoticeService;

@Controller
public class AdminRetrieveNoticeListController {
	/*@Autowired
	private NoticeService noticeService;

	@RequestMapping(value="/admin/notice.do", method=RequestMethod.GET)
	public ModelAndView adminRetrieveNotice() {		
		ModelAndView mv = new ModelAndView();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", 1);
		map.put("endRow", 10);		
		mv.addObject("Notices", noticeService.retrieveNoticeList(map));
		mv.setViewName("authority/adminRetrieveNotice");
		
		return mv;
	}*/
	
	
}
