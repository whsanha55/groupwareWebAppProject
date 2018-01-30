package com.bit.groupware.controller.approval;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.service.approval.ApprovalService;

@Controller
public class FinishController {
	
	@Autowired
	private ApprovalService apprService;
	//승인 문서함 페이지 요청
	@RequestMapping(value="/approvalFinish.do", method=RequestMethod.GET)
	public ModelAndView form() {
		
		ModelAndView mv = new ModelAndView();
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("apprFinalStatus", 1);
		map.put("empNo", "2018-00011");
		mv.addObject("approvals",apprService.retrieveApprovalList(map));
		mv.setViewName("approval/finishList");
		return mv; 
		
		/*map.put("tempNo", "카테고리번호");
		map.put("empNo", "기안자");
		map.put("empCode", "기안부서(코드에 해당하는 부서번호)");
	*/
	}
	
}
