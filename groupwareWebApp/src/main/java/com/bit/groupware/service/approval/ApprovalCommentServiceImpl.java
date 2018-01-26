package com.bit.groupware.service.approval;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.ApprovalCommentVO;
import com.bit.groupware.persistent.approval.ApprovalCommentDAO;

@Service
public class ApprovalCommentServiceImpl implements ApprovalCommentService{

	@Autowired
	private ApprovalCommentDAO dao;
		
	
	public void modifyApprovalComment(ApprovalCommentVO approvalComment) {
		dao.updateApprovalComment(approvalComment);		
	}

	public void removeApprovalComment(int commentNo) {
		dao.deleteApprovalComment(commentNo);		
	}

	public void registerApprovalComment(ApprovalCommentVO approvalComment) {
		dao.insertApprovalComment(approvalComment);	
	}

	
	

	

}
