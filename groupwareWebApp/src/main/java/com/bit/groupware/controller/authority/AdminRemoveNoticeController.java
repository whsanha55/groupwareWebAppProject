package com.bit.groupware.controller.authority;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.groupware.service.authority.NoticeService;

@Controller
public class AdminRemoveNoticeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRemoveNoticeController.class);

	@Autowired
	private NoticeService noticeService;

	//공지사항 삭제 요청
	@RequestMapping(value="/admin/deleteNotice.do", method=RequestMethod.GET)
	public String submit(@RequestParam(value = "noticeNo", required = true) List<String> noticeNos) { 
		logger.info("번호!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! : {}", noticeNos);

		List<Integer> noList = new ArrayList<Integer>();
		for(String no : noticeNos) {
			noList.add(Integer.parseInt(no));
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", noList);
	
		noticeService.removeNotice(map);
		return "redirect:/admin/noticeList.do";
	}
}
