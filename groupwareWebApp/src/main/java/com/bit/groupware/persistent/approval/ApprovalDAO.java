package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import com.bit.user.domain.approval.ApprovalVO;

public interface ApprovalDAO {

	List<ApprovalVO> selectApprovalList(Map<String, Object> map);

	ApprovalVO selectApproval(int apprNo);

	int insertApproval(ApprovalVO approval);

	void updateApproval(int apprNo);
}
