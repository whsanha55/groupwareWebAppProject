package com.bit.groupware.service.approval;

import com.bit.groupware.domain.approval.ApprovalCommentVO;

public interface ApprovalCommentService {

	//�ڸ�Ʈ ����
	void modifyApprovalComment(ApprovalCommentVO approvalComment);
	
	//�ڸ�Ʈ ����
	void removeApprovalComment(int commentNo);
	
	
	
}
