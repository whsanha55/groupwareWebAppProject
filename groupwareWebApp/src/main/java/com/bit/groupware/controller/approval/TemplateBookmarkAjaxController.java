package com.bit.groupware.controller.approval;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.approval.TemplateBookmarkVO;
import com.bit.groupware.domain.approval.TemplateVO;
import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.service.approval.TemplateBookmarkService;

@Controller
public class TemplateBookmarkAjaxController {

	@Autowired
	private TemplateBookmarkService bookmarkService;

	@RequestMapping(value = "/templateBookmarkAjax.do", method = RequestMethod.GET)
	@ResponseBody
	public int getTemplateList(
			@RequestParam int tmpNo, 
			@RequestParam int bookmarkNo,
			Principal principal) {
		TemplateBookmarkVO templateBookmarkVO = new TemplateBookmarkVO();
		
		if (bookmarkNo == 0) { // 신규 즐겨찾기 등록
			EmployeeVO employeeVO = new EmployeeVO();
			employeeVO.setEmpNo(principal.getName());

			templateBookmarkVO.setEmployee(employeeVO);
			TemplateVO templateVO = new TemplateVO();
			templateVO.setTmpNo(tmpNo);
			templateBookmarkVO.setTemplate(templateVO);
			return bookmarkService.registerTemplateBookmark(templateBookmarkVO);
		} else { // 즐겨 찾기 삭제
			bookmarkService.removeTemplateBookmark(bookmarkNo);
			return 0;
		}
	}
}
