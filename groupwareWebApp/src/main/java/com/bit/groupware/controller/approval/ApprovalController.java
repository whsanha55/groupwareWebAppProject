package com.bit.groupware.controller.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.approval.ApprovalRecordVO;
import com.bit.groupware.service.approval.ApprovalRecordService;
import com.bit.groupware.service.approval.ApprovalService;

@Controller
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;
	@Autowired
	private ApprovalRecordService approvalRecordService;

	//문서 상세조회
		@RequestMapping(value="/approvalDetail.do", method= RequestMethod.GET)
		public ModelAndView approvalDetail(@RequestParam(value="apprNo") int apprNo,
										   @RequestParam(value="status") int status) {
			
	/*		//확인 일시 기록
			List<ApprovalRecordVO> list=approvalRecordService.retrieveApprovalRecordList(apprNo);
			if(list.get(0).getCheckDate() == null) {	//사원번호가 있는 인덱스 찾는 구문 추가할 것
				Date date = new Date();
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String checkDate = format.format(date);
				list.get(0).setCheckDate(checkDate);
			}
			ApprovalVO approval = approvalService.retrieveApproval(apprNo);
			approval.setApprovalRecords(list); */
				
			ModelAndView mv =new ModelAndView();
			mv.addObject("status",status);
			//1:결재요청함 2:결재대기함 3:나머지
			//mv.addObject("approval", approval);
			mv.addObject("approval",approvalService.retrieveApproval(apprNo));
			mv.setViewName("approval/approvalDetail/pop");
			return mv;
		}
		
		//문서 첨부파일 다운로드
		@RequestMapping(value="/downloadApprFile.do",method=RequestMethod.GET)
		public ModelAndView downloadFile(
				@RequestParam("originalFileName")String originalFileName,
				@RequestParam("systemFileName")String systemFileName) {

			ModelAndView mv=new ModelAndView();
			mv.addObject("originalFileName",originalFileName);
			mv.addObject("systemFileName",systemFileName);
			mv.setViewName("downloadApprovalFileView"); 
			
			return mv;
			
		}
		
		
		//문서 현황 조회
		@RequestMapping(value="/approvalRecord.do",method=RequestMethod.GET)
		public ModelAndView approvalRecord(@RequestParam(value="apprNo") int apprNo) {
			ModelAndView mv = new ModelAndView();
			
			List<ApprovalRecordVO> list=approvalRecordService.retrieveApprovalRecordList(apprNo);

	 		mv.addObject("records",list);
			mv.setViewName("approval/approvalRecord/pop"); 
			return mv;
		}
		
}
