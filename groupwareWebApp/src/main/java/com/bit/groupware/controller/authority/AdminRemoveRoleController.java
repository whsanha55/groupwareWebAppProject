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

import com.bit.groupware.service.authority.NoticeService;
import com.bit.groupware.service.authority.RoleService;

@Controller
public class AdminRemoveRoleController {
	private static final Logger logger = LoggerFactory.getLogger(AdminRemoveRoleController.class);

	@Autowired
	private RoleService roleService;

	//공지사항 삭제 요청
	@RequestMapping(value="/admin/deleteRole.do", method=RequestMethod.GET)
	public int submit(@RequestParam(value = "rId", required = true) List<String> rIds) { 
		logger.info("번호!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! : {}", rIds);

		List<String> idList = new ArrayList<String>();
		for(String rId : rIds) {
			idList.add(rId);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", idList);
		logger.info("번호>>>>>>>>>>>>>>>>>>>>> : {}", map.toString());
		roleService.removeRole(map);
		return 0;
	}
}
