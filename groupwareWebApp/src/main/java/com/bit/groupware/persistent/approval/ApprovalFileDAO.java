package com.bit.groupware.persistent.approval;

import java.util.List;

import com.bit.groupware.domain.approval.ApprovalFileVO;

public interface ApprovalFileDAO {

	void insertApprovalFileList(List<ApprovalFileVO> approvalFiles);

	void deleteApprovalFiles(int fileNo);
}
