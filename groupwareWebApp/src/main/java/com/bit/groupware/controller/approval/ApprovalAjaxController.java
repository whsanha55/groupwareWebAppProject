package com.bit.groupware.controller.approval;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.groupware.domain.approval.ApprovalFileVO;
import com.bit.groupware.domain.approval.ApprovalRecordVO;
import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.domain.approval.TemplateVO;
import com.bit.groupware.domain.authority.UserVO;
import com.bit.groupware.domain.employee.EmployeeVO;

import com.bit.groupware.service.approval.ApprovalRecordService;
import com.bit.groupware.service.approval.ApprovalService;
import com.bit.groupware.util.UploadApprovalFiles;

@Controller
public class ApprovalAjaxController {
	private static final Logger logger= LoggerFactory.getLogger(ApprovalAjaxController.class);
	
	@Autowired
	private ApprovalService approvalService;
	
	@Autowired
	private ApprovalRecordService approvalRecordService;

	
	@RequestMapping(value="/approvalAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public int approvalAjax(ApprovalVO approval, 
			TemplateVO template, 
			@RequestParam int receiverNo, 
			HttpSession session, 
			Principal principal) throws Exception {
		//approval => validDate, urgency, apprTitle, apprContent,  apprFinalStatus
		
		EmployeeVO employee = new EmployeeVO();
		employee.setEmpNo(principal.getName());
		
		approval.setEmployee(employee);
		approval.setTemplate(template);
		
		
		//���� ����
		for(MultipartFile file : approval.getUpload()) {
			if(!file.isEmpty()) {
				ApprovalFileVO approvalFile = UploadApprovalFiles.uploadFile(file, session.getServletContext());
				approval.addApprovalFile(approvalFile);
			}
		}
		
		approvalService.registerApproval(approval, receiverNo);
		
		return approval.getApprFinalStatus();
	}
	
	
	//ajax ������ ó��
		@RequestMapping(value="/approvalPaging.do", method=RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> listRequestApproval(
				@RequestParam(required=false,defaultValue="false") boolean isAdmin,
				@RequestParam(value="keyfield",required=false) String keyfield ,
				@RequestParam(value="keyword",required=false) String keyword ,
				@RequestParam(value="keyword1",required=false) String keyword1 ,
				@RequestParam(value="startRow") int startRow ,
				@RequestParam(value="endRow") int endRow,
				@RequestParam(value="apprFinalStatus") int apprFinalStatus, 
				@RequestParam(value="apprStatus",required=false) int apprStatus){
			
			
			Map<String,Object> map=new HashMap<String,Object>();
			String id = null;
			
			if(!isAdmin) {
				SecurityContext context=SecurityContextHolder.getContext();
				Authentication authentication = context.getAuthentication();
				UserVO user=(UserVO)authentication.getPrincipal();
				id=user.getUsername();
			} else {
				id = "admin";
			}
							
				if(apprStatus < 7) {		//apprStatus�ʿ���°� 7�� ����
					map.put("linempNo", id); //����,����,���
					map.put("apprStatus", apprStatus); //1: ���� 6:���� 0 :���
				}else {
					map.put("empNo", id);	//����,�ݷ�,�ӽ�,��û, ������
				}
			 
			
			map.put("apprFinalStatus", apprFinalStatus);  //0:��û,����,����,��� 1:���� 3:�ݷ� 4:�ӽ� 5:������
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);	
			map.put("keyword1", keyword1);
			
			
			
			int totalCount=0;
			if(apprFinalStatus==1 || apprFinalStatus==3 || apprFinalStatus ==5) {		
				totalCount = approvalService.retrieveAllApprovalCount(map); 	//����,�ݷ�, �������� ���
				logger.info("======================= �� ���� �� : {}", totalCount);
			}else {
				totalCount = approvalService.retrieveApprovalCount(map);
			}
			
			if(totalCount < endRow) {
				endRow = totalCount;
			}
			
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			logger.info("======================= �������ȣ : {}", startRow);
			logger.info("======================= �����ȣ : {}", endRow);
			
		
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("totalCount", totalCount);
			if(apprFinalStatus==1 || apprFinalStatus==3 || apprFinalStatus==5) {	//����, �ݷ�, �������� ���
				returnMap.put("approvals", approvalService.retrieveAllApprovalList(map) );
				returnMap.put("empNo", id);  //�ݷ�
			}else {
				returnMap.put("approvals", approvalService.retrieveApprovalList(map));
			}
			return returnMap;
			
		}
		
	
	//���� ȸ�� ó��
	@RequestMapping(value="/returnApproval.do",method=RequestMethod.GET)
	@ResponseBody
	public boolean returnApproval(@RequestParam(value="apprNo") int apprNo) {
		
		ApprovalVO appr=new ApprovalVO();
		appr.setApprNo(apprNo);
		appr.setApprFinalStatus(4); 
		approvalService.modifyApproval(appr); 
		appr=approvalService.retrieveApproval(apprNo);
		return true;
		
	}
	
	
	
	
	//���� ���� ó��
	@RequestMapping(value="/postponeApproval.do",method=RequestMethod.GET)
	@ResponseBody
	public boolean approve(@RequestParam(value="apprNo") int apprNo) {
		
		SecurityContext context=SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		UserVO user=(UserVO)authentication.getPrincipal();
		String id=user.getUsername();
				
		ApprovalVO appr = approvalService.retrieveApproval(apprNo);
		appr.setApprFinalStatus(2); 
		List<ApprovalRecordVO> list = appr.getApprovalRecords();
		int recNo=0;
		for(int i=0; i<list.size(); i++) {
			String empNo = list.get(i).getReceiverLine().getLineEmployee().getEmpNo();
			if(empNo == id) {
				list.get(i).setApprStatus(2); 
			}
		}
		approvalService.modifyApproval(appr);
		return true;
	}
	

	//����(����/�ݷ�) ���� ó��
	@RequestMapping(value="/executeApprovalAjax.do",method=RequestMethod.GET)
	@ResponseBody
	public int executeApprovalAjax(@RequestParam(value="apprNo") int apprNo, 
				   @RequestParam(value="apprStatus") int apprStatus ,
			       @RequestParam(value="commentContent") String commentContent,
			       @RequestParam(value="recordNo") int recordNo ,
			       Principal principal) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("apprNo", apprNo);
		map.put("apprStatus",apprStatus);
		map.put("recordNo", recordNo);
		map.put("empNo", principal.getName());
		map.put("commentContent", commentContent);
		approvalRecordService.executeApprovalRecord(map);
		return apprStatus;
	
	}
	
	
}
