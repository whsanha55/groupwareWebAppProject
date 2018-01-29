package com.bit.groupware.controller.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.domain.employee.MessageVO;
import com.bit.groupware.service.employee.MessageService;
@SessionAttributes("empInfo")
@Controller
public class ProceedMessageController {
	
	@Autowired
	private MessageService msgService;
	// 쪽지함 페이지 요청

	@RequestMapping(value = "/retrieveMessage.do", method = RequestMethod.GET)
	public ModelAndView proceedMsgList(@ModelAttribute("messages") Map<String,Object> empInfo ) {
		
		// 받은쪽지함 리스트를 보여준다.
		
		ModelAndView mv = new ModelAndView();
		
		
		//세션에 바인딩 해놓은 
		//사원에서 사원번호, startRow endRow에 해당하는 정보를 매개변수로 넘겨준다 
		
		mv.addObject("messages", msgService.retrieveMessageList(empInfo));
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
		
//		@RequestMapping(value="/retrieveMessage.do", method =  RequestMethod.GET)
//		proceedMsgList() 랑 requestMapping 중복이라 오류나서 주석처리했습니다.
		public ModelAndView SelectMessage(@RequestParam(value="msgNo") int msgNo) {
			
			
			ModelAndView mv = new ModelAndView();
			
			//쪽지 상세정보를 조회한다. - 쪽지 읽음 여부를 변경한다. 트랜잭션을 수행한다. (서비스에서)
			
			msgService.retrieveMessage(msgNo);
							
			//팝업페이지
			mv.setViewName("messagePopup");
			return mv;
						
		}
	

}
