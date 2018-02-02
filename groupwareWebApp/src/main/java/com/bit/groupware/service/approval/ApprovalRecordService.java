package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.ApprovalRecordVO;

public interface ApprovalRecordService {

	//���� ���� ��Ȳ ��ȸ
	List<ApprovalRecordVO> retrieveApprovalRecordList(int apprNo);
	
	//���繮�� ����.�ݷ�.����
	void executeApprovalRecord(ApprovalRecordVO approvalRecord);
	
	//���� ������ ���翩�� Ȯ��
	int retrieveApprovalRecallable(int apprNo);
	
	//�޴� �� ���� ���� ǥ�ÿ�
	int retrieveNewRecordCount(Map<String, String> map);
}
