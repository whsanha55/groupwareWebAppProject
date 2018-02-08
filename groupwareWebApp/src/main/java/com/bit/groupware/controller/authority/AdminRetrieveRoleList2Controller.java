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
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.AuthRoleVO;
import com.bit.groupware.domain.authority.RoleVO;
import com.bit.groupware.service.authority.RoleService;

@Controller
public class AdminRetrieveRoleList2Controller {
	@Autowired
	private RoleService roleService;
	
	//역할 지정목록 조회 요청
	@RequestMapping(value="/admin/designRole.do", method=RequestMethod.GET)
	public String form(@RequestParam(value="aName") String aName) {
		//ModelAndView mv = new ModelAndView();
		
		/*mv.addObject("aroles", roleService.retrieveRoleByRname(aName));
		mv.addObject("roles", roleService.retrieveRoleList(aName));*/
		//mv.setViewName("authority/admin_designateRole");
		return "authority/admin_designateRole";
	}
	
	@RequestMapping(value="/admin/DesigRolePagingAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getTemplateList(
			@RequestParam String aNo,
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
		
		AuthRoleVO arole = new AuthRoleVO();
		arole.setaNo(aNo);
		
		List<RoleVO> roles = roleService.retrieveRoleList(map);
		for(RoleVO role : roles) {
			arole.setrId(role.getrId());
			int count = roleService.rIdIsExist(arole);
			System.out.print("1111111111111111!"+count);
			if(count == 0) {
				System.out.print("2222222222222222222!"+role.getrId());
				role.setIsRegistration("1");
			} else if(count == 1){  
				System.out.print("33333333333333333333333333!"+role.getrId());
				role.setIsRegistration("0");
			}
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("totalCount", totalCount);
		returnMap.put("roles", roles);
		
		return returnMap;
	}
	
}
