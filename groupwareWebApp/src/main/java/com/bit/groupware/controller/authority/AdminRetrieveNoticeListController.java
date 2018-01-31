package com.bit.groupware.controller.authority;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.groupware.domain.authority.NoticeVO;
import com.bit.groupware.service.authority.NoticeService;

@Controller
public class AdminRetrieveNoticeListController {
	@Autowired
	private NoticeService noticeService;

	//�������� ��� ��ȸ ��û
	@RequestMapping(value = "/PagingAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getTemplateList(@RequestParam int startRow ,@RequestParam int endRow) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int totalCount = noticeService.retrieveNoticeCount();
		if(totalCount < endRow) {
			endRow = totalCount;
		}
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<NoticeVO> notices = noticeService.retrieveNoticeList(map);
		System.out.print("��!!!!!!!!!!!!"+notices.toString());
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("totalCount", totalCount);
		returnMap.put("notices", notices);
		
		return returnMap;
	}

	
}
