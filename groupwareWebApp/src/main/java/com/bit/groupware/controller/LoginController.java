package com.bit.groupware.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.domain.employee.PlanVO;
import com.bit.groupware.service.employee.PlanService;

/*@SessionAttributes("id")*/
@Controller
public class LoginController {

   //Logging
   public static final Logger logger = LoggerFactory.getLogger(LoginController.class);
   
/*   @Autowired
   private EmployeeService employeeService;*/
   
   @Autowired
	private PlanService planService;
   
   //권한 로그인
   @RequestMapping(value = "/login.do", method = RequestMethod.GET)
   public String form() {
      return "login";
   }
   
   
   //모든 사용자 로그인
   @RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
   public String form1() {

      return "login";
   }
   
   //메인
   @RequestMapping(value = "/index.do", method = RequestMethod.GET)
   public ModelAndView form2() {
       UserVO user = (UserVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
       String isAdmin = user.getIsAdmin();
       logger.info("isAdmin : {}" , isAdmin);
       
       ModelAndView mv = new ModelAndView();
       Map<String, Object> map = new HashMap<String, Object>();
       map.put("keyfield", "검색조건");
       map.put("keyword", "검색어");
       map.put("cName", user.getDeptName());
       logger.info("map : {}" , map);
		
       if(isAdmin.equals("T")) {
          mv.setViewName("adminMain");
       } else {
          mv.setViewName("main");
          List<PlanVO> plans = planService.retrievePlanListByDeptName(map);
          mv.addObject("plans",plans);
       }
   
       return mv;
      
   }
   
      

   

}
