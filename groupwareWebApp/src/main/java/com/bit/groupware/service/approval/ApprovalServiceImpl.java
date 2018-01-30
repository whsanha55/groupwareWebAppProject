package com.bit.groupware.service.approval;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bit.groupware.domain.approval.ApprovalFileVO;
import com.bit.groupware.domain.approval.ApprovalRecordVO;
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

	// 결재문서 조회
	public List<ApprovalVO> retrieveApprovalList(Map<String, Object> map) {
		return dao.selectApprovalList(map);
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

		// 3. 결재 이력 등록(최초 결재자만)
		List<ApprovalRecordVO> records = approval.getApprovalRecords();
		ApprovalRecordVO record = records.get(0);
		recordDAO.insertApprovalRecord(record);

		// 4. 알림 등록-트리거
	}

	// 결재 문서 회수
	public void modifyApproval(ApprovalVO approval) {
		// 1. 결재 이력 삭제
		recordDAO.deleteApprovalRecord(approval.getApprNo());

		// 2. 결재문서 최종상태 여부 변경 = approval.setFinalStatus는 컨트롤러에서?
		dao.updateApproval(approval);
	}

}
