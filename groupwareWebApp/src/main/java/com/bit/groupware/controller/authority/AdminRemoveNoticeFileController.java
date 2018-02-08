package com.bit.groupware.controller.authority;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.service.authority.NoticeService;

@Controller
public class AdminRemoveNoticeFileController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRemoveNoticeFileController.class);

	@Autowired
	private NoticeService noticeService;

		//공지사항 삭제 요청
		@RequestMapping(value="/admin/deleteNoticeFile.do", method=RequestMethod.GET)
		@ResponseBody
		public int submit(@RequestParam(value = "noticeNo", required = true) int noticeNo) { 
			logger.info("번호!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! : {}", noticeNo);
			
			noticeService.removeNoticeFile(noticeNo);
			
			return 0;
		}
}
