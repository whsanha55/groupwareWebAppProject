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
	@Autowired
	private NoticeService noticeService;

	//공지사항 목록 조회 요청
	@RequestMapping(value="/admin/notice.do", method=RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", 1);
		map.put("endRow", 10);
		mv.addObject("articles", noticeService.retrieveNoticeList(map));
		mv.setViewName("authority/admin_notice");
		return mv;
	}
	
	
}
