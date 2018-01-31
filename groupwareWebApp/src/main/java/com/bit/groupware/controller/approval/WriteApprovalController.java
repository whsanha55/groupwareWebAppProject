package com.bit.groupware.controller.approval;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.service.approval.ReceiverService;
import com.bit.groupware.service.approval.TemplateCategoryService;
import com.bit.groupware.service.approval.TemplateService;

@Controller
public class WriteApprovalController {

	@Autowired
	private TemplateCategoryService categoryService;

	@Autowired
	private TemplateService templateService;
	
	@Autowired
	private ReceiverService receiverService;

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
	public ModelAndView form(@RequestParam(required=false, defaultValue="0") int tmpNo ) {
		ModelAndView mv = new ModelAndView();
		if(tmpNo > 0) {
			mv.addObject("template",templateService.retrieveTemplate(tmpNo));
		}
		
		mv.addObject("receivers",receiverService.retrieveReceiverList());
		
		mv.setViewName("approval/writeApproval");
		return mv;
		
		
	}

	
}
