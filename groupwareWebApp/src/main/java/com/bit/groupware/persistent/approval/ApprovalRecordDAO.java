package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.ApprovalRecordVO;

public interface ApprovalRecordDAO {

	List<ApprovalRecordVO> selectApprovalRecordList(int apprNo);

	void insertApprovalRecord(Map<String, Object> map);

	void insertApprovalRecordProcedure(Map<String, Integer> map);

	void updateApprovalRecordStatus(Map<String, Object> map);

	void deleteApprovalRecord(int apprNo);

	int selectApprovalRecallable(int apprNo);
	
	List<Integer> selectNewRecordCount(String empNo);
	
	int checkisFinalApprovalLine(int recordNo);
	
	void updateCheckData(int recordNo);

}
