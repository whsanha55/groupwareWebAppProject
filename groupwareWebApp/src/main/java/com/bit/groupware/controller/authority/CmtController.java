package com.bit.groupware.controller.authority;

import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.authority.CmtVO;
import com.bit.groupware.service.authority.CmtService;

@Controller
public class CmtController {
	private static final Logger logger = LoggerFactory.getLogger(CmtController.class);
	
	@Autowired
	private CmtService cmtService;

	// 댓글 입력
    @RequestMapping("/insert.do")
    @ResponseBody
    public void insert(@ModelAttribute CmtVO cmt, HttpSession session) throws Exception{
    	cmt.setCmtWriter("test");
    	logger.info("댓글@@@@@@@@@@@@@@@@@@@@@@@ : {}", cmt);    	
        cmtService.registerCmt(cmt);
    }
    
    // 댓글 목록(@Controller방식 : veiw(화면)를 리턴)
    /*@RequestMapping("/list.do")
    @ResponseBody
    public ModelAndView list(@RequestParam int postNo, ModelAndView mv) throws Exception{
    	logger.info("~~~~~~~~~~~~~~~~~~게시글번호 : {}", postNo);
        List<CmtVO> list = cmtService.retrieveComment(postNo);
        // 뷰이름 지정
        mv.setViewName("authority/detailPost");
        // 뷰에 전달할 데이터 지정
        mv.addObject("list", list);
        // replyList.jsp로 포워딩
        return mv;
    }*/
    
    
    /*
    // 댓글 목록(@RestController Json방식으로 처리 : 데이터를 리턴)
    @RequestMapping("listJson.do")
    @ResponseBody // 리턴데이터를 json으로 변환(생략가능)
    public List<CmtVO> listJson(@RequestParam int cmtNo) throws Exception{
    	List<CmtVO> list = cmtService.retrieveComment();
        return list;
    }
    */
}
