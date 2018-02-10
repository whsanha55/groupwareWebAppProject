package com.bit.groupware.controller.authority;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.NoticeFileVO;
import com.bit.groupware.domain.authority.NoticeVO;
import com.bit.groupware.service.authority.NoticeService;
import com.bit.groupware.util.UploadFiles;

@SessionAttributes("notice")
@Controller
public class AdminModifyNoticeController {
	@Autowired
	private NoticeService noticeService;

	// 공지사항 수정 폼 요청
	@RequestMapping(value = "/admin/modifyNotice.do", method = RequestMethod.GET)
	public ModelAndView form(@RequestParam(value = "noticeNo", required = true) int noticeNo) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("notice", noticeService.retrieveNotice(noticeNo));
		mv.setViewName("authority/admin_modifyNotice");
		return mv;
	}

		// 공지사항 수정 요청
		@RequestMapping(value = "/admin/modifyNotice.do", method = RequestMethod.POST)
		public String submit(@ModelAttribute("notice") NoticeVO notice, 
			SessionStatus status, HttpSession session) throws Exception {

			notice.getFiles().clear();
			List<MultipartFile> uploadFiles = notice.getUpload();
			ServletContext context = session.getServletContext();
			for (MultipartFile uploadFile : uploadFiles) {
				if (!uploadFile.isEmpty()) {
					NoticeFileVO noticeFile = UploadFiles.uploadFile(uploadFile, context);
					notice.addNoticeFile(noticeFile);
				}   
			}
			noticeService.modifyNotice(notice);
			status.setComplete();
			return "redirect:/admin/noticeList.do?noticeNo=" + notice.getNoticeNo();
			
		}	
}
