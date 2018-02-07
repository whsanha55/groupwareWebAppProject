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

	// ��� �Է�
    @RequestMapping("/insert.do")
    @ResponseBody
    public void insert(@ModelAttribute CmtVO cmt, HttpSession session) throws Exception{
    	cmt.setCmtWriter("test");
    	logger.info("���@@@@@@@@@@@@@@@@@@@@@@@ : {}", cmt);    	
        cmtService.registerCmt(cmt);
    }
    
    // ��� ���(@Controller��� : veiw(ȭ��)�� ����)
    /*@RequestMapping("/list.do")
    @ResponseBody
    public ModelAndView list(@RequestParam int postNo, ModelAndView mv) throws Exception{
    	logger.info("~~~~~~~~~~~~~~~~~~�Խñ۹�ȣ : {}", postNo);
        List<CmtVO> list = cmtService.retrieveComment(postNo);
        // ���̸� ����
        mv.setViewName("authority/detailPost");
        // �信 ������ ������ ����
        mv.addObject("list", list);
        // replyList.jsp�� ������
        return mv;
    }*/
    
    
    /*
    // ��� ���(@RestController Json������� ó�� : �����͸� ����)
    @RequestMapping("listJson.do")
    @ResponseBody // ���ϵ����͸� json���� ��ȯ(��������)
    public List<CmtVO> listJson(@RequestParam int cmtNo) throws Exception{
    	List<CmtVO> list = cmtService.retrieveComment();
        return list;
    }
    */
}
