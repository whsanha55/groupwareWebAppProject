package com.bit.groupware.controller.approval;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.approval.ApprovalRecordVO;
import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.service.approval.ApprovalRecordService;
import com.bit.groupware.service.approval.ApprovalService;

@Controller
public class MyRequestController {
	private static final Logger logger=LoggerFactory.getLogger(MyRequestController.class);
	@Autowired
	private ApprovalService approvalService;
	@Autowired
	private ApprovalRecordService approvalRecordService;
		
	//결재 요청함 페이지 요청
	@RequestMapping(value="/approvalMyRequest.do", method=RequestMethod.GET)
	public String form() {
		
		return "approval/myRequestList";
	}
	
	//ajax 페이지 처리
	@RequestMapping(value="/approvalMyRequestPaging.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> listRequestApproval(
			@RequestParam(value="keyfield",required=false) String keyfield ,
			@RequestParam(value="keyword",required=false) String keyword ,
			@RequestParam(value="startRow") int startRow ,
			@RequestParam(value="endRow") int endRow) {
		
		ModelAndView mv=new ModelAndView();
		Map<String,Object> map=new HashMap<String,Object>();
		
		map.put("empNo", "2018-00011");
		map.put("apprFinalStatus", 0);
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		int totalCount = approvalService.retrieveApprovalCount(map);
		if(totalCount < endRow) {
			endRow = totalCount;
		}
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<ApprovalVO> approvals = approvalService.retrieveApprovalList(map);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("totalCount", totalCount);
		returnMap.put("approvals", approvals);
		return returnMap;
		
	}
	
	//결재 현황 모달 처리
	@RequestMapping(value="/recordModal.do",method=RequestMethod.GET)
	public ModelAndView currentRecord(@RequestParam(value="apprNo") int apprNo){
		List<ApprovalRecordVO> list=approvalRecordService.retrieveApprovalRecordList(apprNo);
		ModelAndView mv=new ModelAndView();
		mv.addObject("records",list);
		mv.setViewName("approval/approvalRecord"); 
		return mv;
	}

}
