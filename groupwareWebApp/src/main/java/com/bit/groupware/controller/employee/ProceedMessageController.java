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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.domain.employee.MessageVO;
import com.bit.groupware.service.employee.MessageService;

@Controller
public class ProceedMessageController {
	
	@Autowired
	private MessageService msgService;
	// ������ ������ ��û

	@RequestMapping(value = "/retrieveMessageList.do", method = RequestMethod.GET)
	public ModelAndView retrieveMessageList(Principal principal) {
		
		// ���������� ����Ʈ�� �����ش�.
		
		ModelAndView mv = new ModelAndView();
		
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		UserDetails user = (UserDetails)authentication.getPrincipal();
		
		String empNo = user.getUsername();
			
		// sequrity�� ��������� ���ε��Ǿ��ִ� - userDetails -- principal�� �ִ� �������� map�� ��Ƽ� �Ѱ���.--> **�����ʿ�.
		// ������� �����ȣ, startRow endRow�� �ش��ϴ� ������ �Ű������� �Ѱ��ش� 
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("empNo", empNo);
		map.put("startRow", 1);
		map.put("endRow", 15);
		
		mv.addObject("messages", msgService.retrieveMessageList(map));
		mv.setViewName("employee/messageList");
		
		return mv;
	}
	
	
	   //�޽��� ���� ��û ó��
		@RequestMapping(value = "/removeMessage.do", method = RequestMethod.GET)
		@ResponseBody
		public String removeMessageList(@RequestParam(value="msgNos") List<Integer> msgNos) {
			
			//List<Integer> msgNos
			
			if(msgNos != null) {
			msgService.removeMessage(msgNos);
			}
			//ajax�� �־��� �޽��� ���� ����/���� jsp		
			return "������ ���ƿ����� �ʿ��� ��ü --> ������������ �ʿ��� ��ü";
		}
		
		
		//�ش� ������ �������� ��ȸ�Ѵ�.
		
		@RequestMapping(value="/retrieveMessage.do", method =  RequestMethod.GET)
		public ModelAndView SelectMessage(@RequestParam(value="msgNo") int msgNo) {
			
			
			ModelAndView mv = new ModelAndView();
			
			//���� �������� ��ȸ�Ѵ�. - ���� ���� ���θ� �����Ѵ�. Ʈ������� �����Ѵ�. (���񽺿���)
			
			mv.addObject("message", msgService.retrieveMessage(msgNo));
							
			//�˾�������
			mv.setViewName("messageDetail");
			return mv;
						
		}
	

}
