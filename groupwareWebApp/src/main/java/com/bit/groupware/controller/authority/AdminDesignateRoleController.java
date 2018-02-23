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

import com.bit.groupware.domain.authority.AuthRoleVO;
import com.bit.groupware.security.ReloadableFilterInvocationSecurityMetadataSource;
import com.bit.groupware.service.authority.RoleService;


@Controller
public class AdminDesignateRoleController {
   @Autowired
   private RoleService roleService;
   
   @Autowired
	private ReloadableFilterInvocationSecurityMetadataSource metaSource;
   
   private static final Logger logger = LoggerFactory.getLogger(AdminDesignateRoleController.class);
   
   @RequestMapping(value="/admin/modifyDesignate.do", method=RequestMethod.POST)
   @ResponseBody
      public int  submit(@RequestParam(value="isRegistration", required=true) List<String> isRegistration, 
                         @RequestParam(value="isNotRegistration", required=true) List<String> isNotRegistration, 
                        @RequestParam(value="aNo", required=true) String aNo) throws Exception { 
      
	 
      List<AuthRoleVO> list = new ArrayList<AuthRoleVO>();
      List<AuthRoleVO> list2 = new ArrayList<AuthRoleVO>();
      for(int i =0;i<isRegistration.size();i++) {
    	  AuthRoleVO arole = new AuthRoleVO();
    	  arole.setrId(isRegistration.get(i));
    	  arole.setaNo(aNo);
    	  list.add(arole);

      }
      
      for(int i =0;i<isNotRegistration.size();i++) {
    	  AuthRoleVO arole = new AuthRoleVO();
    	  arole.setrId(isNotRegistration.get(i));
    	  arole.setaNo(aNo);
    	  list2.add(arole);
      }
      
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("list2",list2);
      map.put("list",list);     
      roleService.registerAuthRole(map);
      
      metaSource.reload();
      
      return 0;
    }
}