package com.bit.groupware.controller.authority;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.groupware.service.authority.NoticeService;

@Controller
public class AdminRegisterNoticeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRegisterNoticeController.class);

	@Autowired
	private NoticeService noticeService;

	//공지사항 글 쓰기 폼 요청
	@RequestMapping(value="/admin/addNotice.do", method=RequestMethod.GET)
	public String form() {
		return "authority/admin_addNotice";
	}
	/*
	//공지사항 글 쓰기 요청
	@RequestMapping(value="/admin/addNotice.do", method=RequestMethod.POST)
	public String submit(NoticeVO notice, HttpSession session) throws Exception { 
		logger.info("notice : {}", notice);
		List<MultipartFile> uploadFiles = notice.getUpload();
		for (MultipartFile file : uploadFiles) {
			if (!file.isEmpty()) {
				logger.info("file : {}", file);
				ServletContext context = session.getServletContext();

				NoticeFileVO noticeFile = UploadFiles.uploadFile(file, context);
				notice.addNoticeFile(noticeFile);
			}
		}
		noticeService.registerNotice(notice);
		return "redirect:/authority/admin_notice.do";
	}*/
}
