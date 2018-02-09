package com.bit.groupware.controller.authority;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.authority.CmtVO;
import com.bit.groupware.domain.authority.RoleVO;
import com.bit.groupware.service.authority.CmtService;

@Controller
public class CmtController {
	private static final Logger logger = LoggerFactory.getLogger(CmtController.class);
	
	@Autowired
	private CmtService cmtService;

	// ´ñ±Û ÀÔ·Â
    @RequestMapping("/insert.do")
    @ResponseBody
    public void insert(@ModelAttribute CmtVO cmt, HttpSession session) throws Exception{
    	cmt.setCmtWriter("test");
    	logger.info("´ñ±Û@@@@@@@@@@@@@@@@@@@@@@@ : {}", cmt);    	
        cmtService.registerCmt(cmt);
    }
    
    @RequestMapping(value="/modifyCmtAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> modifyAuth(CmtVO cmt, @RequestParam(value="cmtContent") String cmtContent)
			throws Exception{
		
		Map<String, String> map = new HashMap<String, String>();
		cmtService.modifyCmt(cmt);
		
		
		return map;
	}
    
   
}
