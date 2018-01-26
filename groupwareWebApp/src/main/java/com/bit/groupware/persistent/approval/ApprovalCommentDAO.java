package com.bit.groupware.persistent.approval;

import java.util.List;

import com.bit.groupware.domain.approval.ApprovalCommentVO;

public interface ApprovalCommentDAO {

	void insertApprovalComment(ApprovalCommentVO approvalComment);

	void updateApprovalComment(ApprovalCommentVO approvalComment);

	void deleteApprovalComment(int commentNo);
	
	
}
