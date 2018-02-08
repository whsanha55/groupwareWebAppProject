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
	
	// �������� ����
	private static final Logger logger = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

	@Autowired
	private NotificationService notificationService;

	// setInterval() �� ���εǾ��ִ� ~do�� ���ε� ��Ʈ�ѷ�.

	
	//�� �˸� ���� ǥ�ÿ�
	@RequestMapping(value="/newNote.do", method=RequestMethod.GET)
	@ResponseBody
	public int getNumber() {
		
//		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		String empNo = user.getUsername();
		
		String empNo = "2018-00011";
		
		return notificationService.retrieveNotificationCount(empNo);
	}
	
	
	//�˸� ��ȸ ( notification���̺� insert, delete�Ͼ�� ���� trigger�߻��� )
	
	//apprRecord���� insert, delete�� �Ͼ �� ���� Ʈ���Ű� ����Ǵµ� NotificationList�� ������ ajaxó������
	
	@RequestMapping(value="/retrieveNotifications.do", method=RequestMethod.GET)
	@ResponseBody
	public List<NotificationVO> selectNotifications() {
		
		
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String empNo = user.getUsername(); // ����� ������ �����ȣ
				
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("endRow", 5);
		map.put("startRow", 1);
		
		
		logger.info("notificationsss " + empNo);
		
		List<NotificationVO> notifications = notificationService.retrieveNotificationList(map);
		
		return notifications;
		
		
	}
	
	
	//�˸� �ο�ѹ� ���� ���ѽ�ũ�ѷ� �߰� �����
	@RequestMapping(value="/selectAllNotificationList.do", method=RequestMethod.GET)
	@ResponseBody
	public List<NotificationVO> selectAllNotifications() {
		
		
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String empNo = user.getUsername(); // ����� ������ �����ȣ
				
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);		
		
		logger.info("notificationsss " + empNo);
		
		List<NotificationVO> notifications = notificationService.retrieveNotificationList(map);
		
		return notifications;
		
		
	} 
	
	//������ ���������� �̵��ϰ� �ش� �˸��� �����Ѵ�.
	@RequestMapping(value="/moveToRelevantApproval.do", method=RequestMethod.GET)
	public String moveNotificationList(@RequestParam(value="noteNo") int noteNo,
										 @RequestParam(value="path") String path) {
		
		//�̷��� �ϸ� �ش� �˸��� �����ǹ����� �� ���¿��� �̵��ϴϱ� -> �翬�� �ƹ����ǵ� �������
		//�ش� �˸���ȣ�� �ش��ϴ� �˸� ����
		
        Map<String,Object> map = new HashMap<String, Object>();
		
		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String empNo = user.getUsername(); // ����� ������ �����ȣ
		
		map.put("empNo", empNo);
		map.put("noteNo", noteNo);
		notificationService.removeNotifications(map);
		//����
		
		
		if(path.equals("direct1")) {
			//���ι����� �̵�
			return "redirect:approvalFinish.do";
		}else if(path.equals("direct3")) {
			//�ݷ������� �̵�
			return "redirect:approvalReject.do";
		}else if(path.equals("direct6")) {
			//���������� �̵�
			return "redirect:approvalRef.do";
		}else if(path.equals("direct7")) {
			//�����û���� �̵�
			return "redirect:approvalTodo.do";
		}else if(path.equals("direct8")) {
			//������� �̵� 
			return "redirect:approvalMyRequest.do";
			
		}
				
		return "approval/emptyRequest";
				
	}

}