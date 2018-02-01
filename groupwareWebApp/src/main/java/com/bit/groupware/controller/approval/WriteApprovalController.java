package com.bit.groupware.controller.approval;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.service.approval.ApprovalService;
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

	// 문서 작성 - 양식 고르기
	// public ModelAndView category(@AuthenticationPrincipal UserDetailsCustom udc)
	@RequestMapping(value = "/selectTemplate.do", method = RequestMethod.GET)
	public ModelAndView template() {

		ModelAndView mv = new ModelAndView();
		
		// 카테고리 리스트 조회 및 바인딩
		mv.addObject("categoryList", categoryService.retrieveTemplateCategoryList());

		mv.setViewName("approval/selectTemplate");
		return mv;
	}

	// 문서 작성 폼 요청
	@RequestMapping(value = "/writeApproval.do", method = RequestMethod.GET)
	public ModelAndView form(@RequestParam(value="tmpNo", required=false, defaultValue="0") int tmpNo ,
							@RequestParam(value="apprNo", required=false, defaultValue="0") int apprNo) {
		ApprovalVO appr=new ApprovalVO();
		ModelAndView mv = new ModelAndView();
		if(tmpNo > 0) {
			mv.addObject("template",templateService.retrieveTemplate(tmpNo));
		}else if(apprNo > 0) {
			appr=approvalService.retrieveTempApproval(apprNo); 
			mv.addObject("approval", appr);
		}
		

		//로그인없을때 테스트용으로 try catch묶음  
		try {
			UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			mv.addObject("user", user);
		} catch (Exception e) {
			
		}

		mv.addObject("receivers",receiverService.retrieveReceiverList());
		
		mv.setViewName("approval/writeApproval");
		return mv;
		
		
	}
	
	//결재선 관리 요청 
	@RequestMapping("/receiverModal.do")
	public ModelAndView receiverModal() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("receiverModal");
		return mv;
	}

	
}
