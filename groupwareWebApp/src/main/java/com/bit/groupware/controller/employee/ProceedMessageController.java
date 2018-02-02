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

	
	//새 쪽지 개수 표시용
	@RequestMapping(value="/newMsg.do", method=RequestMethod.GET)
	@ResponseBody
	public int getNumber() {
//		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		String empNo = user.getUsername();
		
		String empNo = "2018-00011";
		
		return msgService.retrieveNewMessageCount(empNo);
	}	
	
	
	
	// 쪽지함 페이지 요청
	@RequestMapping(value = "/retrieveMessageList.do", method = RequestMethod.GET)
	public ModelAndView retrieveMessageList(Principal principal) {
		
		// 받은쪽지함 리스트를 보여준다.

		ModelAndView mv = new ModelAndView();

		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		UserDetails user = (UserDetails) authentication.getPrincipal();

		String empNo = user.getUsername();

		// sequrity에 사원정보가 바인딩되어있다 - userDetails -- principal에 있는 정보들을 map에 담아서 넘겨줌.-->
		// **수정필요.
		// 사원에서 사원번호, startRow endRow에 해당하는 정보를 매개변수로 넘겨준다

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("startRow", 1);
		map.put("endRow", 15);

		mv.addObject("messages", msgService.retrieveMessageList(map));
		mv.setViewName("employee/messageList");

		return mv;
	}
	
	// 보낸 쪽지함 리스트 조회
	
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

	// 메시지 삭제 요청 처리
	@RequestMapping(value = "/removeMessage.do", method = RequestMethod.POST)
	@ResponseBody
	public String removeMessageList(@RequestParam(value = "msgNos") String msgNos) {  //1,3,5
		
		
		// List<Integer> msgNos 로 바꿈
		
		String[] temp = msgNos.split(","); // "?,?,? 로 온 문자열을 ,을 기준으로 분리해 String 1차원배열에 담아줌"
		
		//담아준걸 int로 바꿔줌
		
		int[] nums = new int[temp.length];
		
		
		for(int i=0; i<temp.length; i++) {
			//int[] 에 담아줌
			nums[i] = Integer.parseInt(temp[i]);			
		}
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("msgNos", nums);
		logger.info("msgNosssss" + msgNos);
		
		if (nums != null) {
			msgService.removeMessage(map);
			
		}
		// ajax로 넣어줄 메시지 삭제 성공/실패 jsp
		return "success";
	}

	// 해당 쪽지의 상세정보를 조회한다.

	@RequestMapping(value = "/retrieveMessage.do", method = RequestMethod.GET)
	public ModelAndView SelectMessage(@RequestParam(value = "msgNo") int msgNo) {

		ModelAndView mv = new ModelAndView();

		// 쪽지 상세정보를 조회한다. - 쪽지 읽음 여부를 변경한다. 트랜잭션을 수행한다. (서비스에서)

		mv.addObject("message", msgService.retrieveMessage(msgNo));

		// 팝업페이지
		mv.setViewName("approval/messageDetail/pop");
		return mv;

	}

	// 쪽지 DB에 반영

	@RequestMapping(value = "/registerMessage.do", method = RequestMethod.POST)
	@ResponseBody
	public String registerMessage(
			@RequestParam(value = "receipientEmployee") String empId,
			@RequestParam(value = "msgTitle") String msgTitle, 
			@RequestParam(value = "msgContent") String msgContent ) {

		MessageVO message = new MessageVO();
		
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//employee에 굳이.. 담아줬음 1
		EmployeeVO employee = new EmployeeVO();
		String empNo = employee.getEmpNo();
		
		empNo = user.getUsername();
		employee.setEmpNo(empNo);
		
		message.setSenderEmployee(employee);
		
		//employee에 굳이.. 담아줬음 2
		EmployeeVO employee2 = new EmployeeVO();
		String empNo2 = employee2.getEmpNo();
		
		empNo2 = empId;
		employee2.setEmpNo(empNo2);
		
		message.setReceipientEmployee(employee2);
		message.setMsgTitle(msgTitle);
		message.setMsgContent(msgContent);
		
		//DB에 반영 
		msgService.registerMessage(message);
		
		return "success";

	}
	

	// 답장보내기 폼으로 이동
	@RequestMapping(value = "/registerReponseMsgForm.do", method = RequestMethod.POST)
	@ResponseBody
	public MessageVO registerReponseMsgForm (@RequestParam(value = "recEmpNo") String recEmpNo,
									 @RequestParam(value = "recEmpName") String recEmpName ) {
		
		MessageVO message = new MessageVO();
		
		// DB에 있던 발신자 -> 가 수신자가 되고, 현재 로그인한 정보-> 발신자로 세팅해준다.
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		
		//현재로그인한 정보 의 사원번호 id를 SenderEmployeeVO에 매핑. 
		
			
		String senderNo = user.getUsername();
		EmployeeVO senderEmployee = new EmployeeVO();
		EmployeeVO receipientEmployee = new EmployeeVO();
		
		
		senderEmployee.setEmpNo(senderNo);
		
		//req에서 받아온 사원번호와 이름을 ReceiptentEmployeeVo에 매핑.
		
		receipientEmployee.setEmpNo(recEmpNo);
		receipientEmployee.setEmpName(recEmpName);
	
				
		if (receipientEmployee != null) {

			// 발신자 -> 수신자 , 현재로그인한사용자 -> 발신자

			message.setSenderEmployee(receipientEmployee);
			message.setReceipientEmployee(senderEmployee);
			
		}


		return message; //여기엔 ajax연동시 json데이터에 들어갈 객체를 써준다! 

	}
	
	//답장 DB에 등록 및 반영 
	@RequestMapping(value= "/registerResponseMsg.do", method = RequestMethod.POST)
	@ResponseBody
	public MessageVO respondForm(
			                  @RequestParam(value="senderNo") String senderNo,
							  @RequestParam(value="msgTitle") String msgTitle, 
							  @RequestParam(value="msgContent") String msgContent) {	  
		
		
		MessageVO msg = new MessageVO();
		EmployeeVO senderEmployee = new EmployeeVO();
		EmployeeVO receipientEmployee = new EmployeeVO();
		
		// 발신자 아이디, 수신자아이디, 메시지제목, 메시지내용을 MessageVO에 매핑해 DB를 수행한다. 
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				
		//이미 전 컨트롤러에서 매핑되어왔음 -> 그냥 세팅만
		senderEmployee.setEmpNo(user.getUsername());
		receipientEmployee.setEmpNo(senderNo);
	
		
		//메시지 정보매핑
		msg.setReceipientEmployee(receipientEmployee);
		msg.setSenderEmployee(senderEmployee);
		msg.setMsgTitle("RE:"+ msgTitle);
		msg.setMsgContent(msgContent);
		
		
		if(msg.getSenderEmployee().getEmpNo()!=null) {
		
		//DB에 반영 
		msgService.registerMessage(msg);
		}
		
		return msg;
		
	}

	@RequestMapping(value = "/writeMessage.do", method = RequestMethod.GET)
	public String form() {

		return "approval/writeMessage/pop";

	}
		

}
