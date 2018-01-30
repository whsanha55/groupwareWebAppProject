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
	//���� ������ ������ ��û
	@RequestMapping(value="/approvalFinish.do", method=RequestMethod.GET)
	public ModelAndView form() {
		
		ModelAndView mv = new ModelAndView();
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("apprFinalStatus", 1);
		map.put("empNo", "2018-00011");
		mv.addObject("approvals",apprService.retrieveApprovalList(map));
		mv.setViewName("approval/finishList");
		return mv; 
		
		/*map.put("tempNo", "ī�װ���ȣ");
		map.put("empNo", "�����");
		map.put("empCode", "��Ⱥμ�(�ڵ忡 �ش��ϴ� �μ���ȣ)");
	*/
	}
	
}
