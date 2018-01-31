package com.bit.groupware.controller.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReceiverController {

	@RequestMapping("/receiverModal.do")
	public ModelAndView receiverModal() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("receiverModal");
		return mv;
	}
}
