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

	//���� ����ȸ
		@RequestMapping(value="/approvalDetail.do", method= RequestMethod.GET)
		public ModelAndView approvalDetail(@RequestParam(value="apprNo") int apprNo,
										   @RequestParam(value="status") int status) {
			
	/*		//Ȯ�� �Ͻ� ���
			List<ApprovalRecordVO> list=approvalRecordService.retrieveApprovalRecordList(apprNo);
			if(list.get(0).getCheckDate() == null) {	//�����ȣ�� �ִ� �ε��� ã�� ���� �߰��� ��
				Date date = new Date();
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String checkDate = format.format(date);
				list.get(0).setCheckDate(checkDate);
			}
			ApprovalVO approval = approvalService.retrieveApproval(apprNo);
			approval.setApprovalRecords(list); */
				
			ModelAndView mv =new ModelAndView();
			mv.addObject("status",status);
			//1:�����û�� 2:�������� 3:������
			//mv.addObject("approval", approval);
			mv.addObject("approval",approvalService.retrieveApproval(apprNo));
			mv.setViewName("approval/approvalDetail/pop");
			return mv;
		}
		
		//���� ÷������ �ٿ�ε�
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
		
		
		//���� ��Ȳ ��ȸ
		@RequestMapping(value="/approvalRecord.do",method=RequestMethod.GET)
		public ModelAndView approvalRecord(@RequestParam(value="apprNo") int apprNo) {
			ModelAndView mv = new ModelAndView();
			
			List<ApprovalRecordVO> list=approvalRecordService.retrieveApprovalRecordList(apprNo);

	 		mv.addObject("records",list);
			mv.setViewName("approval/approvalRecord/pop"); 
			return mv;
		}
		
}
