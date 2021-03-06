package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.bit.groupware.domain.approval.ApprovalVO;

public interface ApprovalService {

	//결재문서 조회(내가 쓴거)
	List<ApprovalVO> retrieveApprovalList(Map<String, Object> map);

	//결재문서 조회 (남이 쓴거)
	List<ApprovalVO> retrieveAllApprovalList(Map<String, Object> map);
	
	//결재예정함 조회
	List<ApprovalVO> retrieveExpectedList(Map<String, Object> map);
	 
	//결재문서 상세조회
	ApprovalVO retrieveApproval(int apprNo);
	
	//기안문서 상신
	void registerApproval(ApprovalVO approval, int receiverNo);

	//결재문서 회수/승인/보류/반려
	void modifyApproval(ApprovalVO approval);
	
	//갯수 구하기
	int retrieveApprovalCount(Map<String, Object> map);

	//승인,반려문서함 갯수 구하기
	int retrieveAllApprovalCount(Map<String, Object> map);
	
	//결재 예정함 갯수 구하기
	int retrieveExpectedCount(Map<String, Object> map);
	
	//삭제
	void removeApproval(List<Integer> apprNos);
	
	//임시보관함에서 재기안 할 때 조회
	ApprovalVO retrieveTempApproval(int apprNO);
	
	//void removeAboutApproval(ApprovalVO appr);
}
