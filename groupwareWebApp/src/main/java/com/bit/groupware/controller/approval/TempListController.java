package com.bit.groupware.controller.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.service.approval.ApprovalService;

@Controller
public class TempListController {
	private final static Logger logger=LoggerFactory.getLogger(TempListController.class);
	@Autowired
	private ApprovalService approvalService;

	// 임시보관함 페이지 요청
	@RequestMapping(value = "/approvalTemp.do", method = RequestMethod.GET)
	public ModelAndView form() {

		ModelAndView mv = new ModelAndView();

		Map<String, Object> map = new HashMap<String, Object>();
			
		map.put("apprFinalStatus", 4);

		List<ApprovalVO> approvals=approvalService.retrieveApprovalList(map);
		logger.info("문서정보1w: "+approvals.size()); 
		mv.addObject("approvals",approvals );
		
		mv.setViewName("approval/tempList");
		return mv;
	}

}
