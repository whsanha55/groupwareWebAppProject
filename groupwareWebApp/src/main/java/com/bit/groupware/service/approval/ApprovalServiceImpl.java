package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.persistent.approval.ApprovalDAO;
import com.bit.groupware.persistent.approval.ApprovalRecordDAO;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private ApprovalDAO dao;
	
	@Autowired
	private ApprovalRecordDAO recordDAO;
	
	
	//결재문서 조회
	public List<ApprovalVO> retrieveApprovalList(Map<String, Object> map) {
		return dao.selectApprovalList(map);
	}

	//결재문서 상세조회
	public ApprovalVO retrieveApproval(int apprNo) {
		return dao.selectApproval(apprNo);
	}

	//결재문서 상신
	public void registerApproval(ApprovalVO approvalVO, int lineNo) {
		//1. 결재문서 등록
		
		//2. 결재 첨부파일 등록
		
		//3. 결재 이력 등록
		
		//4. 알림 등록
		
		
	}

	//결재 문서 회수
	public void modifyApproval(ApprovalVO approval) {
/*		//1. 최초 결재자의 결재 여부 확인
		boolean isRecallable = recordDAO.selectApprovalRecallable(apprNo);
		
		if(!isRecallable) {
			//2. 결재 이력 삭제
			recordDAO.deleteApprovalRecord(apprNo);
			
			//3. 결재문서 최종상태 여부 변경 = 회수
			dao.updateApproval(approval);
		} */
		
	}


	
	
}
