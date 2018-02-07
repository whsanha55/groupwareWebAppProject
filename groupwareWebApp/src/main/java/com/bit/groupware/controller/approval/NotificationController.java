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
		map.put("endRow", 15);
		map.put("startRow", 1);
		
		
		logger.info("notificationsss " + empNo);
		
		List<NotificationVO> notifications = notificationService.retrieveNotificationList(map);
		
		return notifications;
		
		
	}
	
	
	@RequestMapping(value="/removeNotificationList.do", method=RequestMethod.GET)
	public String removeNotificationList(@RequestParam(value="notificationNos") String notificationNos ) {
		
		//String[] 을 int[]로 바꾸다.
		
		String[] temp = notificationNos.split(",");
		
		//담아준걸 int로 바꿔줌
		int[] nums = new int[temp.length];
		
		for(int i = 0; i<temp.length; i++) {
			nums[i] = Integer.parseInt(temp[i]);
		}
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("notificationNos", nums);
		
		if(nums != null) {
			
			notificationService.removeNotifications(map);
		}
		
		return "success";
	}

}