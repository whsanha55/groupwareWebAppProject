package com.bit.groupware.service.approval;

import java.util.List;

import com.bit.groupware.domain.approval.ApprovalRecordVO;

public interface ApprovalRecordService {

	//���� ���� ��Ȳ ��ȸ
	List<ApprovalRecordVO> retrieveApprovalRecordList(int apprNo);
	
	//���繮�� ����.�ݷ�.����
	void executeApprovalRecord(ApprovalRecordVO approvalRecordVO);
	
	
}
