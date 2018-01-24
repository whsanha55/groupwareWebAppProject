package com.bit.groupware.persistent.approval;

import com.bit.user.domain.approval.ApprovalCommentVO;

public interface ApprovalCommentDAO {

	void insertApprovalComment(ApprovalCommentVO approvalComment);

	void updateApprovalComment(ApprovalCommentVO approvalComment);

	void deleteApprovalComment(int commentNo);
}