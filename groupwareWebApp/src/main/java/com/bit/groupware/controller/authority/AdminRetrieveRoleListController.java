package com.bit.groupware.controller.authority;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.authority.RoleVO;
import com.bit.groupware.service.authority.RoleService;

@Controller
public class AdminRetrieveRoleListController {
	@Autowired
	private RoleService roleService;
	
	//역할 목록 조회 요청
	@RequestMapping(value="/admin/roleList.do", method=RequestMethod.GET)
	public String form() {
		return "authority/admin_roleList";
	}
	
	@RequestMapping(value="/admin/RolePagingAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getTemplateList(
			@RequestParam String keyfield ,
			@RequestParam(required=false) String keyword ,
			@RequestParam int startRow ,
			@RequestParam int endRow
		) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		int totalCount = roleService.retrieveRoleCount(map);
		if(totalCount < endRow) {
			endRow = totalCount;
		}
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<RoleVO> roles = roleService.retrieveRoleList(map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		System.out.print("꺄아아아!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+roles.toString());
		returnMap.put("totalCount", totalCount);
		returnMap.put("roles", roles);
		
		return returnMap;
	}

	
}
