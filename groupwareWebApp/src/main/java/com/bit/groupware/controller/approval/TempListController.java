package com.bit.groupware.controller.approval;

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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.service.approval.ApprovalService;

@Controller
public class TempListController {
	private final static Logger logger=LoggerFactory.getLogger(TempListController.class);
	@Autowired
	private ApprovalService approvalService;

	// 임시보관함 페이지 요청
	@RequestMapping(value = "/approvalTemp.do", method = RequestMethod.GET)
	public String form() {

		return "approval/tempList";
	}
	
	

	
	//선택 삭제
	@RequestMapping(value="/deleteApproval.do",method=RequestMethod.GET)
	public String deleteApproval(@RequestParam(value="checkRow") String checkRow) {

		String[] row=checkRow.split(",");
		 
		List<Integer> apprNos=new ArrayList<Integer>();
		for(int i=0;i<row.length;i++) {
			int apprNo=Integer.parseInt(row[i]);
			apprNos.add(apprNo);
		}
		
		approvalService.removeApproval(apprNos); 
		
		return "redirect:approvalTemp.do";
	}

}
