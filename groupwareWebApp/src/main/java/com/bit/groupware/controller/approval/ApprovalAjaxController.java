package com.bit.groupware.controller.approval;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

	
	//문서 등록
	@RequestMapping(value="/approvalAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public int approvalAjax(ApprovalVO approval, 
			@RequestParam(value="tmpNo",required=false,defaultValue="0") int tmpNo, 
			@RequestParam int receiverNo, 
			@RequestParam(value="deleteAppr", required=false, defaultValue="0") int deleteAppr ,
			@RequestParam(value="reApprDelete", required=false, defaultValue="0") int reApprDelete,
			HttpSession session, 
			Principal principal) throws Exception {
		//approval => validDate, urgency, apprTitle, apprContent,  apprFinalStatus
		
		List<Integer> apprNos =new ArrayList<Integer>();
		apprNos.add(deleteAppr); 
		if(reApprDelete==1) {
			approvalService.removeApproval(apprNos);  
		}
		EmployeeVO employee = new EmployeeVO();
		employee.setEmpNo(principal.getName());
		
		approval.setEmployee(employee);
	
		approval.setTemplate(new TemplateVO(tmpNo));
		
		
		//파일 저장
		for(MultipartFile file : approval.getUpload()) {
			if(!file.isEmpty()) {
				ApprovalFileVO approvalFile = UploadApprovalFiles.uploadFile(file, session.getServletContext());
				approval.addApprovalFile(approvalFile);
			}
		}
		approvalService.registerApproval(approval, receiverNo);
		
		return approval.getApprFinalStatus();
	}
	
	
	//ajax 페이지 처리(결재 보관함들!)
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
							
				if(apprStatus < 7) {		//apprStatus필요없는건 7로 설정
					map.put("linempNo", id); //참조,진행,대기
					map.put("apprStatus", apprStatus); //1: 진행 6:참조 0 :대기
				}else {
					map.put("empNo", id);	//승인,반려,임시,요청, 관리자
				}
			 
			
			map.put("apprFinalStatus", apprFinalStatus);  //0:요청,진행,참조,대기 1:승인 3:반려 4:임시 10:관리자
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);	
			map.put("keyword1", keyword1);
			
			int totalCount=0;
			if(apprFinalStatus==1 || apprFinalStatus==3 || apprFinalStatus ==10) {		
				totalCount = approvalService.retrieveAllApprovalCount(map); 	//승인,반려,관리자인 경우
			}else {
				totalCount = approvalService.retrieveApprovalCount(map);
			}
			
			if(totalCount < endRow) {
				endRow = totalCount;
			}
			
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("totalCount", totalCount);
			if(apprFinalStatus==1 || apprFinalStatus==3 || apprFinalStatus==10) {	//승인, 반려, 관리자인 경우
				returnMap.put("approvals", approvalService.retrieveAllApprovalList(map));
				returnMap.put("empNo", id);  //반려
			}else {
				returnMap.put("approvals", approvalService.retrieveApprovalList(map));
			}
			return returnMap;
			
		}
		
		
		//ajax 페이지 처리(결재 예정함)
		@RequestMapping(value="/approvalExpectedPaging.do", method=RequestMethod.POST)
		@ResponseBody
		public Map<String,Object> listExpectedApproval(
				@RequestParam(required=false,defaultValue="false") boolean isAdmin,
				@RequestParam(value="keyfield",required=false) String keyfield ,
				@RequestParam(value="keyword",required=false) String keyword ,
				@RequestParam(value="keyword1",required=false) String keyword1 ,
				@RequestParam(value="startRow") int startRow ,
				@RequestParam(value="endRow") int endRow){
			
			
			Map<String,Object> map=new HashMap<String,Object>();
			SecurityContext context=SecurityContextHolder.getContext();
			Authentication authentication = context.getAuthentication();
			UserVO user=(UserVO)authentication.getPrincipal();
			String id =user.getUsername();
			 
			map.put("empNo", id);			
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);	
			map.put("keyword1", keyword1);
			
			int totalCount=approvalService.retrieveExpectedCount(map);
			
			if(totalCount < endRow) {
				endRow = totalCount;
			}
			
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("totalCount", totalCount);
			returnMap.put("approvals", approvalService.retrieveExpectedList(map));
			return returnMap;
			
		}	

	
	//결재 회수 처리
	@RequestMapping(value="/returnApproval.do",method=RequestMethod.GET)
	@ResponseBody
	public boolean returnApproval(@RequestParam(value="apprNo") int apprNo) {
		
		ApprovalVO appr=new ApprovalVO();
		appr=approvalService.retrieveApproval(apprNo);
		if(appr.getApprovalRecords().size()<=1) {
			if(appr.getApprovalRecords().get(0).getConfirmDate()==null) {
				appr.setApprFinalStatus(5); 
				approvalService.modifyApproval(appr); 
				//approvalRecordService.removeApprovalRecord(apprNo); 
				return true;
			}else {
				return false;
			}
		}else {	
			return false;
		}
	}

	
	//결재(승인/반려) 행위 처리
	@RequestMapping(value="/executeApprovalAjax.do",method=RequestMethod.GET)
	@ResponseBody
	public int executeApprovalAjax(@RequestParam(value="apprNo") int apprNo, 
				   @RequestParam(value="apprStatus") int apprStatus ,
			       @RequestParam(value="commentContent") String commentContent,
			       Principal principal) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("apprNo", apprNo);
		map.put("apprStatus",apprStatus);
		map.put("empNo", principal.getName());
		map.put("recordNo", approvalRecordService.retrieveRecNo(map));  
		map.put("commentContent", commentContent);
		approvalRecordService.executeApprovalRecord(map);
		return apprStatus;
	
	}
	
	
	//회수문서 삭제
	@RequestMapping(value="/removeReturnAppr.do",method=RequestMethod.GET )
	@ResponseBody
	public int executeReturnDelete(@RequestParam(value="apprNo") int apprNo) {
		
	//	approvalRecordService.removeApprovalRecord(apprNo); 
		List<Integer> apprNos=new ArrayList<Integer>();
		apprNos.add(apprNo);
		
		approvalService.removeApproval(apprNos);
		return 1;
	}
	
}
