package com.bit.groupware.controller.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Spliterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.groupware.domain.approval.NotificationVO;
import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.approval.ApprovalService;
import com.bit.groupware.service.approval.NotificationService;
import com.bit.groupware.service.authority.UserDetailsServiceImpl;

@Controller
public class NotificationController {
	
	// 의존관계 주입
	private static final Logger logger = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

	@Autowired
	private NotificationService notificationService;

	// setInterval() 에 매핑되어있는 ~do에 매핑된 컨트롤러.

	
	//새 알림 개수 표시용
	@RequestMapping(value="/newNote.do", method=RequestMethod.GET)
	@ResponseBody
	public int getNumber() {
		
//		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		String empNo = user.getUsername();
		
		String empNo = "2018-00011";
		
		return notificationService.retrieveNotificationCount(empNo);
	}
	
	
	//알림 조회 ( notification테이블에 insert, delete일어날때 마다 trigger발생함 )
	
	//apprRecord에서 insert, delete가 일어날 때 마다 트리거가 실행되는데 NotificationList를 가져와 ajax처리해줌
	
	@RequestMapping(value="/retrieveNotifications.do", method=RequestMethod.GET)
	@ResponseBody
	public List<NotificationVO> selectNotifications() {
		
		
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String empNo = user.getUsername(); // 사용자 본인의 사원번호
				
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("endRow", 5);
		map.put("startRow", 1);
		
		
		logger.info("notificationsss " + empNo);
		
		List<NotificationVO> notifications = notificationService.retrieveNotificationList(map);
		
		return notifications;
		
		
	}
	
	
	//알림 로우넘버 없이 무한스크롤로 뜨게 만들기
	@RequestMapping(value="/selectAllNotificationList.do", method=RequestMethod.GET)
	@ResponseBody
	public List<NotificationVO> selectAllNotifications() {
		
		
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String empNo = user.getUsername(); // 사용자 본인의 사원번호
				
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);		
		
		logger.info("notificationsss " + empNo);
		
		List<NotificationVO> notifications = notificationService.retrieveNotificationList(map);
		
		return notifications;
		
		
	} 
	
	//연관된 문서함으로 이동하고 해당 알림을 삭제한다.
	@RequestMapping(value="/moveToRelevantApproval.do", method=RequestMethod.GET)
	public String moveNotificationList(@RequestParam(value="noteNo") int noteNo,
										 @RequestParam(value="path") String path) {
		
		//이렇게 하면 해당 알림이 삭제되버리고 그 상태에서 이동하니까 -> 당연히 아무조건도 통과못함
		//해당 알림번호에 해당하는 알림 삭제
		
        Map<String,Object> map = new HashMap<String, Object>();
		
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String empNo = user.getUsername(); // 사용자 본인의 사원번호
		
		map.put("empNo", empNo);
		map.put("noteNo", noteNo);
		notificationService.removeNotifications(map);
		//삭제
		
		
		if(path.equals("direct1")) {
			//승인문서함 이동
			return "redirect:approvalFinish.do";
		}else if(path.equals("direct3")) {
			//반려문서함 이동
			return "redirect:approvalReject.do";
		}else if(path.equals("direct6")) {
			//참조문서함 이동
			return "redirect:approvalRef.do";
		}else if(path.equals("direct7")) {
			//결재요청으로 이동
			return "redirect:approvalTodo.do";
		}else if(path.equals("direct8")) {
			//결재대기로 이동 
			return "redirect:approvalMyRequest.do";
			
		}
				
		return "approval/emptyRequest";
				
	}

}