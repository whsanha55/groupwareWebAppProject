package com.bit.groupware.controller.employee;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.service.employee.CodeService;

@Controller
public class ListHistoryController {
	private static final Logger logger = LoggerFactory.getLogger(ListHistoryController.class);
	@Autowired
	private CodeService codeService;
	
	//�ڵ� ���� �̷� ��ȸ�ϱ� (������)
	@RequestMapping(value="/admin/listCodeHistory.do", method=RequestMethod.GET)
	public ModelAndView listCodeHistoryByAdmin() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", "�˻�����");
		map.put("keyword", "�˻���");
		logger.info("map : {}", map);
		mv.addObject("codeHistories", codeService.retrieveCodeHistoryListByAdmin(map));
		mv.setViewName("employee/admin_codeHistory");
		return mv;
	}
	
	//�ڵ� ���� �̷� ��ȸ�ϱ� (�����)
	@RequestMapping(value="/listCodeHistory.do", method=RequestMethod.GET)
	public ModelAndView listCodeHistory() {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		UserVO user = (UserVO)authentication.getPrincipal();
		map.put("empNo", user.getUsername());
		map.put("keyfield", "�˻�����");
		map.put("keyword", "�˻���");
		logger.info("map : {}", map);
		mv.addObject("codeHistories", codeService.retrieveCodeHistoryList(map));
		mv.setViewName("employee/codeHistory");
		return mv;
	}

}
