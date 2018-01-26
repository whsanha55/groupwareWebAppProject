package com.bit.groupware.controller.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.MessageVO;
import com.bit.groupware.service.employee.MessageService;

@Controller
public class ProceedMessageController {
	
	@Autowired
	private MessageService msgService;
	// 쪽지함 페이지 요청

	@RequestMapping(value = "/retrieveMessage.do", method = RequestMethod.GET)
	public ModelAndView proceedMsgList() {
		
		// 받은쪽지함 리스트를 보여준다.
		
		ModelAndView mv = new ModelAndView();
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		//사원에서 사원번호, startRow endRow에 해당하는 정보를 매개변수로 넘겨준다 
		
		mv.addObject("messages", msgService.retrieveMessageList(map));
		mv.setViewName("messageList");
		
		return mv;
	}
	
	
	   //메시지 삭제 요청 처리
		@RequestMapping(value = "/removeMessage.do", method = RequestMethod.GET)
		public String removeMessageList(@RequestParam(value="msgNos") List<Integer> msgNos) {
			
			//List<Integer> msgNos
			
			if(msgNos != null) {
			msgService.removeMessage(msgNos);
			}
			//ajax로 넣어줄 메시지 삭제 성공/실패 jsp		
			return "isSuccess";
		}
		
		
		//해당 쪽지의 상세정보를 조회한다.
		
		@RequestMapping(value="/retrieveMessage.do", method =  RequestMethod.GET)
		public ModelAndView SelectMessage(@RequestParam(value="msgNo") int msgNo) {
			
			ModelAndView mv = new ModelAndView();
			//??추가 
			//팝업페이지
			mv.setViewName("messagePopup");
			return mv;
			
			
		}
	

}
