package com.bit.groupware.controller.approval;

import java.security.Principal;

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

import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.service.approval.ApprovalService;
import com.bit.groupware.service.approval.ReceiverLineService;
import com.bit.groupware.service.approval.ReceiverService;
import com.bit.groupware.service.approval.TemplateCategoryService;
import com.bit.groupware.service.approval.TemplateService;

@Controller
public class WriteApprovalController {
	private static final Logger logger=LoggerFactory.getLogger(WriteApprovalController.class);
	@Autowired
	private TemplateCategoryService categoryService;

	@Autowired
	private TemplateService templateService;
	
	@Autowired
	private ReceiverService receiverService;
	@Autowired
	private ApprovalService approvalService;
	@Autowired
	private ReceiverLineService receiverLineService;

	// ���� �ۼ� - ��� ����
	// public ModelAndView category(@AuthenticationPrincipal UserDetailsCustom udc)
	@RequestMapping(value = "/selectTemplate.do", method = RequestMethod.GET)
	public ModelAndView template() {

		ModelAndView mv = new ModelAndView();
		
		// ī�װ� ����Ʈ ��ȸ �� ���ε�
		mv.addObject("categoryList", categoryService.retrieveTemplateCategoryList());

		mv.setViewName("approval/selectTemplate");
		return mv;
	}

	// ���� �ۼ� �� ��û
	@RequestMapping(value = "/writeApproval.do", method = RequestMethod.GET)
	public ModelAndView form(@RequestParam(value="tmpNo", required=false, defaultValue="0") int tmpNo ,
							@RequestParam(value="apprNo", required=false, defaultValue="0") int apprNo,
							@RequestParam(value="reApprDelete",required=false, defaultValue="0") int reApprDelete) {
		ApprovalVO appr=new ApprovalVO();

 		ModelAndView mv = new ModelAndView();
		if(tmpNo > 0) {
			mv.addObject("template",templateService.retrieveTemplate(tmpNo)); 
		}else if(apprNo > 0) {
			appr=approvalService.retrieveTempApproval(apprNo);  
			mv.addObject("approval", appr);
			/*if(appr.getApprFinalStatus()!=3) {
				mv.addObject("isReAppr", apprNo); 
			}*/
		}

		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		mv.addObject("user", user);
		mv.addObject("receivers", receiverService.retrieveReceiverList(user.getUsername()));
		mv.addObject("reApprDelete", reApprDelete);
		mv.setViewName("approval/writeApproval");
		return mv;

	}
	
	//���缱 ���� ��û 
	@RequestMapping("/receiverModal.do")
	public ModelAndView receiverModal(Principal principal) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("empNo", principal.getName());
		mv.setViewName("receiverModal");
		return mv;
	}
	
	//����� üũ
	@RequestMapping("/retireCheck.do")
	@ResponseBody
	public boolean checkRetire(@RequestParam(value="receiverNo") int receiverNo) {
		int no=receiverLineService.retreiveRetire(receiverNo);
		if(no>0) {
			return false;
		}else {
			return true;
		}
	}

	
}
