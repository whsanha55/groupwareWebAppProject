package com.bit.groupware.controller.approval;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.service.approval.ApprovalRecordService;

@Controller
public class NewMarkController {

	@Autowired
	private ApprovalRecordService service; 
	
	@RequestMapping(value="/newMark.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getNumber(Principal principal) {
		
		List<Integer> list = service.retrieveNewRecordCount(principal.getName());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("todoCount", list.get(0));
		map.put("refCount", list.get(1));
		return map;
	}
	
}
