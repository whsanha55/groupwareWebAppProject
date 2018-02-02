package com.bit.groupware.controller.employee;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.domain.employee.MessageVO;
import com.bit.groupware.service.authority.UserDetailsServiceImpl;
import com.bit.groupware.service.employee.MessageService;

@Controller
public class ProceedMessageController {
	private static final Logger logger = LoggerFactory.getLogger(UserDetailsServiceImpl.class);
	
	@Autowired
	private MessageService msgService;
	// ������ ������ ��û

	@RequestMapping(value = "/retrieveMessageList.do", method = RequestMethod.GET)
	public ModelAndView retrieveMessageList(Principal principal) {

		// ���������� ����Ʈ�� �����ش�.

		ModelAndView mv = new ModelAndView();

		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		UserDetails user = (UserDetails) authentication.getPrincipal();

		String empNo = user.getUsername();

		// sequrity�� ��������� ���ε��Ǿ��ִ� - userDetails -- principal�� �ִ� �������� map�� ��Ƽ� �Ѱ���.-->
		// **�����ʿ�.
		// ������� �����ȣ, startRow endRow�� �ش��ϴ� ������ �Ű������� �Ѱ��ش�

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("startRow", 1);
		map.put("endRow", 15);

		mv.addObject("messages", msgService.retrieveMessageList(map));
		mv.setViewName("employee/messageList");

		return mv;
	}
	
	// ���� ������ ����Ʈ ��ȸ
	
	@RequestMapping(value="retrieveSendMessageList.do", method=RequestMethod.GET)
	public ModelAndView retrieveSendMessageList(Principal principal) {
		ModelAndView mv = new ModelAndView();
		
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Map<String, Object> map = new HashMap<String, Object>();
			
		map.put("startRow", 1);
		map.put("endRow", 15);
		map.put("senderEmpNo", user.getUsername());
		
		mv.addObject("messages", msgService.retrieveMessageList(map));
		mv.setViewName("employee/sendMessageList");
		
		
		return mv;
	}

	// �޽��� ���� ��û ó��
	@RequestMapping(value = "/removeMessage.do", method = RequestMethod.POST)
	@ResponseBody
	public String removeMessageList(@RequestParam(value = "msgNos") String msgNos) {  //1,3,5
		
		
		// List<Integer> msgNos �� �ٲ�
		
		String[] temp = msgNos.split(","); // "?,?,? �� �� ���ڿ��� ,�� �������� �и��� String 1�����迭�� �����"
		
		//����ذ� int�� �ٲ���
		
		int[] nums = new int[temp.length];
		
		
		for(int i=0; i<temp.length; i++) {
			//int[] �� �����
			nums[i] = Integer.parseInt(temp[i]);			
		}
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("msgNos", nums);
		logger.info("msgNosssss" + msgNos);
		
		if (nums != null) {
			msgService.removeMessage(map);
			
		}
		// ajax�� �־��� �޽��� ���� ����/���� jsp
		return "success";
	}

	// �ش� ������ �������� ��ȸ�Ѵ�.

	@RequestMapping(value = "/retrieveMessage.do", method = RequestMethod.GET)
	public ModelAndView SelectMessage(@RequestParam(value = "msgNo") int msgNo) {

		ModelAndView mv = new ModelAndView();

		// ���� �������� ��ȸ�Ѵ�. - ���� ���� ���θ� �����Ѵ�. Ʈ������� �����Ѵ�. (���񽺿���)

		mv.addObject("message", msgService.retrieveMessage(msgNo));

		// �˾�������
		mv.setViewName("approval/messageDetail/pop");
		return mv;

	}

	// ���� DB�� �ݿ�

	@RequestMapping(value = "/registerMessage.do", method = RequestMethod.POST)
	@ResponseBody
	public String registerMessage(
			@RequestParam(value = "receipientEmployee") String empId,
			@RequestParam(value = "msgTitle") String msgTitle, 
			@RequestParam(value = "msgContent") String msgContent ) {

		MessageVO message = new MessageVO();
		
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//employee�� ����.. ������� 1
		EmployeeVO employee = new EmployeeVO();
		String empNo = employee.getEmpNo();
		
		empNo = user.getUsername();
		employee.setEmpNo(empNo);
		
		message.setSenderEmployee(employee);
		
		//employee�� ����.. ������� 2
		EmployeeVO employee2 = new EmployeeVO();
		String empNo2 = employee2.getEmpNo();
		
		empNo2 = empId;
		employee2.setEmpNo(empNo2);
		
		message.setReceipientEmployee(employee2);
		message.setMsgTitle(msgTitle);
		message.setMsgContent(msgContent);
		
		//DB�� �ݿ� 
		msgService.registerMessage(message);
		
		return "success";

	}
	

	// ���庸���� ������ �̵�
	@RequestMapping(value = "/registerReponseMsgForm.do", method = RequestMethod.POST)
	@ResponseBody
	public MessageVO registerReponseMsgForm (@RequestParam(value = "recEmpNo") String recEmpNo,
									 @RequestParam(value = "recEmpName") String recEmpName ) {
		
		MessageVO message = new MessageVO();
		
		// DB�� �ִ� �߽��� -> �� �����ڰ� �ǰ�, ���� �α����� ����-> �߽��ڷ� �������ش�.
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		
		//����α����� ���� �� �����ȣ id�� SenderEmployeeVO�� ����. 
		
			
		String senderNo = user.getUsername();
		EmployeeVO senderEmployee = new EmployeeVO();
		EmployeeVO receipientEmployee = new EmployeeVO();
		
		
		senderEmployee.setEmpNo(senderNo);
		
		//req���� �޾ƿ� �����ȣ�� �̸��� ReceiptentEmployeeVo�� ����.
		
		receipientEmployee.setEmpNo(recEmpNo);
		receipientEmployee.setEmpName(recEmpName);
	
				
		if (receipientEmployee != null) {

			// �߽��� -> ������ , ����α����ѻ���� -> �߽���

			message.setSenderEmployee(receipientEmployee);
			message.setReceipientEmployee(senderEmployee);
			
		}


		return message; //���⿣ ajax������ json�����Ϳ� �� ��ü�� ���ش�! 

	}
	
	//���� DB�� ��� �� �ݿ� 
	@RequestMapping(value= "/registerResponseMsg.do", method = RequestMethod.POST)
	@ResponseBody
	public MessageVO respondForm(
			                  @RequestParam(value="senderNo") String senderNo,
							  @RequestParam(value="msgTitle") String msgTitle, 
							  @RequestParam(value="msgContent") String msgContent) {	  
		
		
		MessageVO msg = new MessageVO();
		EmployeeVO senderEmployee = new EmployeeVO();
		EmployeeVO receipientEmployee = new EmployeeVO();
		
		// �߽��� ���̵�, �����ھ��̵�, �޽�������, �޽��������� MessageVO�� ������ DB�� �����Ѵ�. 
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				
		//�̹� �� ��Ʈ�ѷ����� ���εǾ���� -> �׳� ���ø�
		senderEmployee.setEmpNo(user.getUsername());
		receipientEmployee.setEmpNo(senderNo);
	
		
		//�޽��� ��������
		msg.setReceipientEmployee(receipientEmployee);
		msg.setSenderEmployee(senderEmployee);
		msg.setMsgTitle("RE:"+ msgTitle);
		msg.setMsgContent(msgContent);
		
		
		if(msg.getSenderEmployee().getEmpNo()!=null) {
		
		//DB�� �ݿ� 
		msgService.registerMessage(msg);
		}
		
		return msg;
		
	}

	@RequestMapping(value = "/writeMessage.do", method = RequestMethod.GET)
	public String form() {

		return "approval/writeMessage/pop";

	}
		

}
