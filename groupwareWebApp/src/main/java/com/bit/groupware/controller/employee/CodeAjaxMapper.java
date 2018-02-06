package com.bit.groupware.controller.employee;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.employee.CodeVO;
import com.bit.groupware.service.employee.CodeService;

@Controller
public class CodeAjaxMapper {

	@Autowired
	private CodeService codeService;
	
	@RequestMapping(value="/retrieveDepartmentList.do",method=RequestMethod.GET)
	@ResponseBody
	public List<String> retrieveDepartmentList() {
		List<CodeVO> codes = codeService.retrieveDeptCodeList();
		List<String> list = new ArrayList<String>();
		for(CodeVO code : codes ) {
			list.add(code.getcName());
		}
		
		return list;
	}
}
