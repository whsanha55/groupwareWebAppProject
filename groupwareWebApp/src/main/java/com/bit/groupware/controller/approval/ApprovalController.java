package com.bit.groupware.controller.approval;

import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.approval.ApprovalRecordVO;
import com.bit.groupware.domain.approval.ReceiverLineVO;
import com.bit.groupware.service.approval.ApprovalRecordService;
import com.bit.groupware.service.approval.ApprovalService;
import com.bit.groupware.service.approval.ReceiverLineService;

@Controller
public class ApprovalController {
	private static final Logger logger=LoggerFactory.getLogger(ApprovalController.class);
	@Autowired
	private ApprovalService approvalService;
	@Autowired
	private ApprovalRecordService approvalRecordService;
	@Autowired
	private ReceiverLineService receiverLineService;
	
		//문서 상세조회
		@RequestMapping(value="/approvalDetail.do", method= RequestMethod.GET)
		public ModelAndView approvalDetail(@RequestParam(value="apprNo") int apprNo,
										   @RequestParam(value="status") int status,
										   Principal principal) {

				
			ModelAndView mv =new ModelAndView();
			mv.addObject("status",status);
			//1:결재요청함 2:결재대기함 3:나머지
			List<ReceiverLineVO> lines=receiverLineService.retrieveApprovalLineList(apprNo);
			int apprCount=0;
			int refCount=0;
			int recCount=0;
			for(ReceiverLineVO line:lines) {
				if(line.getApprType()==0) {
					apprCount++;
				}else {
					refCount++;
				}
				
				if(line.getApprovalRecords()!=null) {
					recCount++;
				}
			}

			
			mv.addObject("apprCount",apprCount);
			mv.addObject("refCount",refCount);
			mv.addObject("recCount",recCount);
			mv.addObject("approval",approvalService.retrieveApproval(apprNo));
			mv.addObject("receiverLine",lines);
			mv.addObject("empNo", principal.getName());
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
		
		
		//문서 확인일시 기록
		@RequestMapping(value="/checkDate.do", method=RequestMethod.GET)
		@ResponseBody
		public String checkDate(@RequestParam(value="recordNo", required=true) int recordNo) {
			logger.info("=================recordNo : {}", recordNo);
			approvalRecordService.modifyCheckDate(recordNo);
			return "update";
		}
		
}
