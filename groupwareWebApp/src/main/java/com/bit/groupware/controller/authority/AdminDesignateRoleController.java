package com.bit.groupware.controller.authority;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.authority.AuthRoleVO;
import com.bit.groupware.domain.authority.RoleVO;
import com.bit.groupware.service.authority.RoleService;


@Controller
public class AdminDesignateRoleController {

	@Autowired
	private RoleService roleService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDesignateRoleController.class);
	
	@RequestMapping(value="/admin/modifyDesignate.do", method=RequestMethod.POST)
	@ResponseBody
	   public int  submit(@RequestParam(value="isRegistration", required=true) List<String> isRegistration, 
			   				 @RequestParam(value="rId", required=true) List<String> rId, 
			   				@RequestParam(value="aNo", required=true) String aNo) throws Exception { 
		
		AuthRoleVO arole = new AuthRoleVO();
		arole.setaNo(aNo);
		
		for(int i = 0; i < rId.size(); i++) {
			RoleVO role = roleService.retrieveRole(rId.get(i));
			arole.setrId(rId.get(i));
			int count = roleService.rIdIsExist(arole);
			
			if(isRegistration.get(i).equals("0") && count==0) {  //등록
				logger.info("등록!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + rId.get(i));
				roleService.registerAuthRole(arole);
				
			} else if(isRegistration.get(i).equals("1") && count!=0) {
				logger.info("미등록!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + rId.get(i));
				roleService.removeAuthRole(rId.get(i));
			}
		}
	      return 0;
	   }
}
