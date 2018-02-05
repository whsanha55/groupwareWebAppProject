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

	//공지사항 목록 조회 요청
	@RequestMapping(value = "/admin/NoticePagingAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getNoticeList(
			@RequestParam String keyfield ,
			@RequestParam(required=false) String keyword ,
			@RequestParam int startRow ,
			@RequestParam int endRow
		) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		int totalCount = noticeService.retrieveNoticeCount(map);
		if(totalCount < endRow) {
			endRow = totalCount;
		}
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<NoticeVO> notices = noticeService.retrieveNoticeList(map);
		System.out.print("꺄아아아!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+notices.toString());
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("totalCount", totalCount);
		returnMap.put("notices", notices);
		
		return returnMap;
	}


	
}
