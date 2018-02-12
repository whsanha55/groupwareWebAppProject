package com.bit.groupware.controller.authority;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.authority.NoticeVO;
import com.bit.groupware.service.authority.NoticeService;

@Controller
public class RetrieveMainNoticeListController {
	@Autowired
	private NoticeService noticeService;


	@RequestMapping(value="/MainPagingAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getTemplateList() {
		
		List<NoticeVO> notices = noticeService.retrieveNoticeList();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		returnMap.put("notices", notices);
		System.out.println("=================================="+ notices.toString());
		return returnMap;
	}
	
}
