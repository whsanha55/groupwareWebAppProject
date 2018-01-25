package com.bit.groupware.service.approval;

import com.bit.groupware.domain.approval.ApprovalCommentVO;

public interface ApprovalCommentService {

	//코멘트 수정
	void modifyApprovalComment(ApprovalCommentVO approvalCommentVO);
	
	//코멘트 삭제
	void removeApprovalComment(int commentNo);
	
	
	
}
