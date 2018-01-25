package com.bit.groupware.controller.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FinishListController {

	//승인 문서함 페이지 요청
	@RequestMapping(value="/finish.do", method=RequestMethod.GET)
	public String form() {
		return "/approval/finishList";
	}
	
}
