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
	// ������ ������ ��û

	@RequestMapping(value = "/retrieveMessage.do", method = RequestMethod.GET)
	public ModelAndView proceedMsgList() {
		
		// ���������� ����Ʈ�� �����ش�.
		
		ModelAndView mv = new ModelAndView();
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		//������� �����ȣ, startRow endRow�� �ش��ϴ� ������ �Ű������� �Ѱ��ش� 
		
		mv.addObject("messages", msgService.retrieveMessageList(map));
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
		
		@RequestMapping(value="/retrieveMessage.do", method =  RequestMethod.GET)
		public ModelAndView SelectMessage(@RequestParam(value="msgNo") int msgNo) {
			
			ModelAndView mv = new ModelAndView();
			//??�߰� 
			//�˾�������
			mv.setViewName("messagePopup");
			return mv;
			
			
		}
	

}
