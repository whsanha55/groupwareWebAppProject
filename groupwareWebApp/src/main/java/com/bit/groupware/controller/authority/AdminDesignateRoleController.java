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
      
      List<AuthRoleVO> list = new ArrayList<AuthRoleVO>();
      for(int i =0;i<isRegistration.size();i++) {
         if(isRegistration.get(i).equals("0")) {   //등록
            System.out.println("==================="+rId.get(i));
            AuthRoleVO arole = new AuthRoleVO();
            arole.setrId(rId.get(i));
            arole.setaNo(aNo);
            list.add(arole);
         } 
      }
      
      
      
      //삭제
      roleService.removeAuthRole(aNo);
      
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("list",list);
      
      System.out.println("111111111111111111111111111111111111"+list.toString());
      if(list.size() != 0) {
         System.out.println("22222222222222222222222222"+map.toString());
         roleService.registerAuthRole(map);
      }
   
         return 0;
      }
}