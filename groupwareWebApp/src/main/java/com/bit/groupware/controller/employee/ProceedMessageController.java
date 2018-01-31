package com.bit.groupware.controller.employee;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.domain.employee.MessageVO;
import com.bit.groupware.service.employee.MessageService;

import ch.qos.logback.core.net.SyslogOutputStream;

@Controller
public class ProceedMessageController {
	
	@Autowired
	private MessageService msgService;
	// 쪽지함 페이지 요청

	@RequestMapping(value = "/retrieveMessageList.do", method = RequestMethod.GET)
	public ModelAndView retrieveMessageList(Principal principal) {
		
		// 받은쪽지함 리스트를 보여준다.
		
		ModelAndView mv = new ModelAndView();
		
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		UserDetails user = (UserDetails)authentication.getPrincipal();
		
		String empNo = user.getUsername();
			
		// sequrity에 사원정보가 바인딩되어있다 - userDetails -- principal에 있는 정보들을 map에 담아서 넘겨줌.--> **수정필요.
		// 사원에서 사원번호, startRow endRow에 해당하는 정보를 매개변수로 넘겨준다 
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("empNo", empNo);
		map.put("startRow", 1);
		map.put("endRow", 15);
		
		mv.addObject("messages", msgService.retrieveMessageList(map));
		mv.setViewName("employee/messageList");
		
		return mv;
	}
	
	
	   //메시지 삭제 요청 처리
		@RequestMapping(value = "/removeMessage.do", method = RequestMethod.GET)
		@ResponseBody
		public String removeMessageList(@RequestParam(value="msgNos") List<Integer> msgNos) {
			
			//List<Integer> msgNos
			
			if(msgNos != null) {
			msgService.removeMessage(msgNos);
			}
			//ajax로 넣어줄 메시지 삭제 성공/실패 jsp		
			return "원래는 돌아왔을때 필요한 객체 --> 다음페이지에 필요한 객체";
		}
		
		
		//해당 쪽지의 상세정보를 조회한다.
		
		@RequestMapping(value="/retrieveMessage.do", method =  RequestMethod.GET)
		public ModelAndView SelectMessage(@RequestParam(value="msgNo") int msgNo) {
			
			
			ModelAndView mv = new ModelAndView();
			
			//쪽지 상세정보를 조회한다. - 쪽지 읽음 여부를 변경한다. 트랜잭션을 수행한다. (서비스에서)
			
			mv.addObject("message", msgService.retrieveMessage(msgNo));
							
			//팝업페이지
			mv.setViewName("messageDetail");
			return mv;
						
		}
		
		//쪽지 DB에 반영 
		
		@RequestMapping(value="/registerMessage.do", method= RequestMethod.GET)
		public void registerMessage(@RequestParam(value="message") MessageVO message) {
			
			//쪽지 내용을 DB에 반영한다.
			
			msgService.registerMessage(message);		
			
		}
		
		
		//답장보내기
		@RequestMapping(value="/registerReponseMsg", method= RequestMethod.GET)
		public void registerReponseMsg(@RequestParam(value="message") MessageVO message) {
			
			//DB에 있던 발신자 -> 가 수신자가 되고, 수신자-> 발신자로 세팅해준다.
			EmployeeVO receiptent = message.getReceipientEmployee();
			EmployeeVO sender = message.getSenderEmployee();
			
			if(receiptent.getEmpNo() != sender.getEmpNo()) {
				
				//발신자 -> 수신자 , 수신자 -> 발신자
				
				message.setSenderEmployee(receiptent);
				message.setReceipientEmployee(sender);
				
				//해당정보로 메시지 등록 
				msgService.registerMessage(message);
				
				
			} else {
				//지워주세요
				System.out.println("erooooooooooooooooooooooooor");
			}
			
		}
		
		
	

}
