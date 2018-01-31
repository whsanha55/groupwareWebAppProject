package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.ApprovalRecordVO;

public interface ApprovalRecordDAO {

	List<ApprovalRecordVO> selectApprovalRecordList(int apprNo);

	void insertApprovalRecord(Map<String, Integer> map);

	void insertApprovalRecordProcedure(Map<String, Integer> map);

	void updateApprovalRecordStatus(ApprovalRecordVO approvalRecord);

	void deleteApprovalRecord(int apprNo);

	int selectApprovalRecallable(int apprNo);

}
