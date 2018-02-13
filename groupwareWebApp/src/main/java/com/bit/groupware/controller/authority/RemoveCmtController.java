package com.bit.groupware.controller.authority;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.service.authority.CmtService;

@Controller
public class RemoveCmtController {
	private static final Logger logger = LoggerFactory.getLogger(RemoveCmtController.class);
	@Autowired
	private CmtService cmtService;	

	// �Խñ� ���� ��û�� ó���� ��Ʋ�ѷ� �޼ҵ�
	@RequestMapping(value="/deleteCmt.do", method=RequestMethod.GET)
	@ResponseBody
	public int remove(@RequestParam(value="cmtNo", required=true)int cmtNo) throws Exception {		
		logger.info("������ȣ!!!!!!!!!!!!!!: {}", cmtNo);
		cmtService.removeCmt(cmtNo);
		
		return 0;			
	}

}
