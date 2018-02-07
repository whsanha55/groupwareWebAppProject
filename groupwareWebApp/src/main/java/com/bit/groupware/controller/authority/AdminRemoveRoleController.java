package com.bit.groupware.controller.authority;

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

import com.bit.groupware.service.authority.NoticeService;
import com.bit.groupware.service.authority.RoleService;

@Controller
public class AdminRemoveRoleController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRemoveRoleController.class);

	@Autowired
	private RoleService roleService;

	//역할 삭제 요청
	@RequestMapping(value="/admin/deleteRole.do", method=RequestMethod.GET)
	@ResponseBody 
	public Map<String, Object> submit(@RequestParam(value = "rId", required = true) List<String> rIds) { 

		List<String> idList = new ArrayList<String>();
		for(String rId : rIds) {
			idList.add(rId);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", idList);
		
		for(String id : idList) {
			int count = roleService.aNoIsExist(id);
			logger.info("번호>>>>>>>>>>>>>>>>>>>>> : {}", count);
			if(count == 0) {
				roleService.removeRole(map);
				map.put("isSuccess", "true");
			}else {
				map.put("isSuccess", "false");
			}
		}
		return map;
	}
}
