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

import com.bit.groupware.domain.authority.AuthEmpListVO;
import com.bit.groupware.domain.authority.AuthEmpVO;
import com.bit.groupware.service.authority.AuthorityService;


@Controller
public class AdminDesignateAuthorityController {

	@Autowired
	private AuthorityService authorityService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDesignateAuthorityController.class);
	
	@RequestMapping(value="/admin/designAuthority.do", method=RequestMethod.GET)
	public String form() {
		return "authority/admin_designateAuthority";
	}
	
	@RequestMapping(value="/AuthEmpListAjax.do" , method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAuthEmpList(@RequestParam String keyfield ,
			@RequestParam(required=false) String keyword ,
			@RequestParam int startRow ,
			@RequestParam int endRow, @RequestParam(value="aNo") String aNo){
	
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("aNo", aNo);
		
		int totalCount = authorityService.retrieveAuthEmpCount(map);
		if(totalCount < endRow) {
			endRow = totalCount;
		}
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<AuthEmpListVO> authEmps = authorityService.retrieveAuthEmpList(map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		logger.info("/////////////retrieveAuthEmpList///////////" , authEmps);
		returnMap.put("totalCount", totalCount);
		returnMap.put("authEmps", authEmps);
		returnMap.put("aNo", aNo);
		
		
		return returnMap;
	}
	
	@RequestMapping(value="/registerAuthEmpAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean submit(
				@RequestParam(value="aNo") String aNo, 
				@RequestParam(value="isRegistration", required=true) String isRegistration, 
				@RequestParam(value="empNos") String empNos) {
		
		
		String[] empNoArray = empNos.split(",");
		List<AuthEmpVO> list = new ArrayList<AuthEmpVO>();
		for(int i =0;i<empNoArray.length;i++) {
			if(isRegistration.split(",")[i].equals("1")) {
				AuthEmpVO authEmp = new AuthEmpVO();
				authEmp.setEmpNo(empNoArray[i]);
				authEmp.setaNo(aNo);
				list.add(authEmp);
			} 
		}
		
		//삭제
		authorityService.removeAuthEmp(aNo);
		
		
		authorityService.registerAuthEmp(list);
		return true;
		
/*		
		logger.info("번호/////////////////////////////// {} " , aNos);
		List<String> aNoList = new ArrayList<String>();
		for(String aNo : aNos) {
			aNoList.add(aNo);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", aNoList);
		
		authorityService.removeAuthEmp(map);
		
		for(String isRegistraions : isRegistration) {
			if(isRegistration.equals("0")) {
				logger.info("/////////////등록///////////// {}" , map );
				authorityService.registerAuthEmp(map);
				map.put("isSuccess", "true");
			}else if(isRegistration.equals("1")){
				logger.info("////////삭제///////////// {}" , map );
				authorityService.removeAuthEmp(map);
				map.put("isSuccess", "false");
			}	
		}
		return map;	*/
		//return null;
	}
	
}
