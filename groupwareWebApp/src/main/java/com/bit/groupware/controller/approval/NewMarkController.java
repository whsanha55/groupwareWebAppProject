package com.bit.groupware.controller.approval;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.service.approval.ApprovalRecordService;

@Controller
public class NewMarkController {

	@Autowired
	private ApprovalRecordService service; 
	
	@RequestMapping(value="/newMark.do", method=RequestMethod.POST)
	@ResponseBody
	public int getNumber(@RequestParam(required=false)String keyfield) {
		
		Map<String, String> map = new HashMap<String, String>();
//		UserVO user = (UserVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		map.put("empNo", user.getUsername());
		map.put("empNo", "2018-00011");	
		map.put("keyfield", keyfield);
		
		return service.retrieveNewRecordCount(map);
	}
	
}
