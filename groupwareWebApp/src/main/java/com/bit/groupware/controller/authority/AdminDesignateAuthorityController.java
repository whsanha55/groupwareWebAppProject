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
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.AuthEmpListVO;
import com.bit.groupware.domain.authority.AuthEmpVO;
import com.bit.groupware.security.ReloadableFilterInvocationSecurityMetadataSource;
import com.bit.groupware.service.authority.AuthorityService;

@Controller
public class AdminDesignateAuthorityController {

	@Autowired
	private AuthorityService authorityService;

	@Autowired
	private ReloadableFilterInvocationSecurityMetadataSource metaSource;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDesignateAuthorityController.class);

	@RequestMapping(value = "/admin/designAuthority.do", method = RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("authority/admin_designateAuthority");
		
		return mv;
	}

	@RequestMapping(value = "/AuthEmpListAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getAuthEmpList(@RequestParam String keyfield,
			@RequestParam(required = false) String keyword, @RequestParam int startRow, @RequestParam int endRow,
			@RequestParam(value = "aNo") String aNo) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("aNo", aNo);

		int totalCount = authorityService.retrieveAuthEmpCount(map);
		if (totalCount < endRow) {
			endRow = totalCount;
		}

		map.put("startRow", startRow);
		map.put("endRow", endRow);

		List<AuthEmpListVO> authEmps = authorityService.retrieveAuthEmpList(map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		logger.info("/////////////retrieveAuthEmpList///////////", authEmps);
		returnMap.put("totalCount", totalCount);
		returnMap.put("authEmps", authEmps);
		returnMap.put("aNo", aNo);

		return returnMap;
	}

	
	
	@RequestMapping(value = "/registerAuthEmpAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean submit(@RequestParam(value = "aNo", required=true) String aNo,
			@RequestParam(value = "isRegistration", required = false, defaultValue="") String isRegistration,
			@RequestParam(value = "isNotRegistration", required=false, defaultValue="") String isNotRegistration) throws Exception {

		logger.info("////////////////////isRegistration {}", isRegistration);
		logger.info("////////////////////isNotRegistration {}", isNotRegistration);

		
		String[] isRegistrationArray = isRegistration.split(",");
		String[] isNotRegistrationArray = isNotRegistration.split(",");
		
		logger.info("////////////////////isRegistration.size {}", isRegistrationArray.length);
		logger.info("////////////////////isNotRegistration.size {}", isNotRegistrationArray.length);
		
		List<String> list2 = authorityService.retrieveAuthEmpNo(aNo);
		
		
		
		
		List<AuthEmpVO> list = new ArrayList<AuthEmpVO>();
		if(!isRegistration.equals("") && isRegistrationArray.length > 0) {		
			for (int i = 0; i < isRegistrationArray.length; i++) {
				if(!list2.contains(isRegistrationArray[i])) {
					AuthEmpVO authEmp = new AuthEmpVO();
					authEmp.setEmpNo(isRegistrationArray[i]);
					authEmp.setaNo(aNo);
					list.add(authEmp);
				}
			
			}
		}
		

		List<AuthEmpVO> list1 = new ArrayList<AuthEmpVO>();
		if(!isNotRegistration.equals("") && isNotRegistrationArray.length > 0) {			
			for (int i = 0; i < isNotRegistrationArray.length; i++) {
				AuthEmpVO authEmp = new AuthEmpVO();
				authEmp.setEmpNo(isNotRegistrationArray[i]);
				authEmp.setaNo(aNo);
				list1.add(authEmp);
			}
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("addList", list);
		map.put("removeList", list1);

		
		
		authorityService.registerAuthEmp(map);
		
		metaSource.reload();

		logger.info("===============addlist {}" , list);
		logger.info("================removelist {}", list1);
		
		return true;
	}

	@RequestMapping(value="/checkEmpNo.do" , method=RequestMethod.POST)
	@ResponseBody
	public boolean check(@RequestParam(value="aNo") String aNo, @RequestParam(value="empNo") String empNo) {
			List<String> list = authorityService.retrieveAuthEmpNo(aNo);
			return list.contains(empNo);
			/*for(int i=0; i<list.size(); i++){
				if(empNo.equals(list.get(i))){
					return true;
				}
			}
		return false;*/
	}
}
