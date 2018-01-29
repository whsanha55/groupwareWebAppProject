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
	// ������ ������ ��û

	@RequestMapping(value = "/retrieveMessage.do", method = RequestMethod.GET)
	public ModelAndView proceedMsgList(@ModelAttribute("messages") Map<String,Object> empInfo ) {
		
		// ���������� ����Ʈ�� �����ش�.
		
		ModelAndView mv = new ModelAndView();
		
		
		//���ǿ� ���ε� �س��� 
		//������� �����ȣ, startRow endRow�� �ش��ϴ� ������ �Ű������� �Ѱ��ش� 
		
		mv.addObject("messages", msgService.retrieveMessageList(empInfo));
		mv.setViewName("messageList");
		
		return mv;
	}
	
	
	   //�޽��� ���� ��û ó��
		@RequestMapping(value = "/removeMessage.do", method = RequestMethod.GET)
		public String removeMessageList(@RequestParam(value="msgNos") List<Integer> msgNos) {
			
			//List<Integer> msgNos
			
			if(msgNos != null) {
			msgService.removeMessage(msgNos);
			}
			//ajax�� �־��� �޽��� ���� ����/���� jsp		
			return "isSuccess";
		}
		
		
		//�ش� ������ �������� ��ȸ�Ѵ�.
		
//		@RequestMapping(value="/retrieveMessage.do", method =  RequestMethod.GET)
//		proceedMsgList() �� requestMapping �ߺ��̶� �������� �ּ�ó���߽��ϴ�.
		public ModelAndView SelectMessage(@RequestParam(value="msgNo") int msgNo) {
			
			
			ModelAndView mv = new ModelAndView();
			
			//���� �������� ��ȸ�Ѵ�. - ���� ���� ���θ� �����Ѵ�. Ʈ������� �����Ѵ�. (���񽺿���)
			
			msgService.retrieveMessage(msgNo);
							
			//�˾�������
			mv.setViewName("messagePopup");
			return mv;
						
		}
	

}
