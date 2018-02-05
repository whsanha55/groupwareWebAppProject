package com.bit.groupware.service.approval;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.ApprovalFileVO;
import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.persistent.approval.ApprovalDAO;
import com.bit.groupware.persistent.approval.ApprovalFileDAO;
import com.bit.groupware.persistent.approval.ApprovalRecordDAO;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private ApprovalDAO dao;

	@Autowired
	private ApprovalFileDAO fileDAO;

	@Autowired
	private ApprovalRecordDAO recordDAO;

	// 결재문서 조회(내가쓴거)
	public List<ApprovalVO> retrieveApprovalList(Map<String, Object> map) {
		return dao.selectApprovalList(map);
	}
	
	//결재문서 조회(승인,반려문서함)
	public List<ApprovalVO> retrieveAllApprovalList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectAllApprovalList(map); 
	}

	// 결재문서 상세조회
	public ApprovalVO retrieveApproval(int apprNo) {
		return dao.selectApproval(apprNo);
	}


	// 기안문서 상신
	public void registerApproval(ApprovalVO approval, int receiverNo) {
		// 1. 결재문서 등록
		int apprNo = dao.insertApproval(approval);
		approval.setApprNo(apprNo);

		// 2. 결재 첨부파일 등록
		List<ApprovalFileVO> files = approval.getApprovalFiles();
		if (files.size() != 0) {
			for (ApprovalFileVO file : files) {
				file.setApproval(approval);
			}
			fileDAO.insertApprovalFileList(files);
		}

		// 3. 결재이력 등록 , 임시보관은 이력등록안함
		if(approval.getApprFinalStatus() ==0) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("apprNo", apprNo);
			map.put("receiverNo", receiverNo);
			recordDAO.insertApprovalRecordProcedure(map);
		}
		
		// 4. 알림 등록-트리거
		
	}


	// 결재 문서 회수/보류
	public void modifyApproval(ApprovalVO approval) {
		//'회수'인 경우 결재 이력 삭제
		if(approval.getApprFinalStatus() == 4) {
			recordDAO.deleteApprovalRecord(approval.getApprNo());	
		}
		//결재문서 최종상태 여부 변경
		dao.updateApproval(approval);
		
	}
	
	
	//갯수 구하기
	public int retrieveApprovalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectApprovalCount(map); 
	}

	//삭제
	public void removeApproval(List<Integer> apprNos) {
		// TODO Auto-generated method stub
		dao.deleteApproval(apprNos); 
	}

	public ApprovalVO retrieveTempApproval(int apprNO) {
		// TODO Auto-generated method stub
		return dao.selectTempApproval(apprNO); 
	}

	public int retrieveAllApprovalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectAllApprovalCount(map); 
	}
	
}
