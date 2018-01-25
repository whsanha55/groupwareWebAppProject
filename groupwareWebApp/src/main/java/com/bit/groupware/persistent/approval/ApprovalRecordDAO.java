package com.bit.groupware.persistent.approval;

import java.util.List;

import com.bit.user.domain.approval.ApprovalRecordVO;

public interface ApprovalRecordDAO {

	List<ApprovalRecordVO> selectApprovalRecordList(int apprNo);

	void insertApprovalRecord(ApprovalRecordVO approvalRecord);

	void updateApprovalRecordStatus(ApprovalRecordVO approvalRecord);

	void deleteApprovalRecord(int apprNo);
}
