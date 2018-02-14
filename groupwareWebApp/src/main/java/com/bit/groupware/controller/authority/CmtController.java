package com.bit.groupware.controller.authority;

import java.util.HashMap;
import java.util.List;
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
    @RequestMapping("/listCmt.do")
    @ResponseBody
    public Map<String,Object> list( @RequestParam(value="postNo") int postNo) throws Exception{
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	
    	List<CmtVO> posts = cmtService.retrieveComment(postNo);

    	System.out.println("@@@@@@@@@@@@@@@@@@@@@" +postNo );
      
        map.put("posts", posts);
		
		return map;
    }
    
    // ´ñ±Û ÀÔ·Â
    @RequestMapping("/insert.do")
    @ResponseBody
    public void insert(@ModelAttribute CmtVO cmt, HttpSession session,
          @RequestParam(value="empName") String empName) throws Exception{
       cmt.setCmtWriter(empName);
       logger.info("´ñ±Û@@@@@@@@@@@@@@@@@@@@@@@ : {}", cmt);       
        cmtService.registerCmt(cmt);
    }
    
    @RequestMapping(value="/modifyCmt.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> modifyAuth(CmtVO cmt, @RequestParam(value="cmtContent") String cmtContent)
			throws Exception{
		
		Map<String, String> map = new HashMap<String, String>();
		cmtService.modifyCmt(cmt);
		
		map.put("cmt", "cmt");
		return map;
	}
    
   
}
