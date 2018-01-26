package com.bit.groupware.service.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.ApprovalRecordVO;
import com.bit.groupware.persistent.approval.ApprovalRecordDAO;

@Service
public class ApprovalRecordServiceImpl implements ApprovalRecordService {

	@Autowired
	private ApprovalRecordDAO dao;
	
	//���� ���� ��Ȳ ��ȸ
	public List<ApprovalRecordVO> retrieveApprovalRecordList(int apprNo) {
		dao.selectApprovalRecordList(apprNo);
		return null;
	}

	
	public void executeApprovalRecord(ApprovalRecordVO approvalRecordVO) {
		//1. ���� ���� Ȯ��
		
		//2. ���� �������� ��� ��� ���� Ȯ��
		
		//3. �����̷� ������� ����, ���� �Ͻ� ���
		
		//4. ������ �ڸ�Ʈ ���
		
			//5. ���� �����ڰ� �ƴ� ��� ���� ������ �����̷� ���
		
			//6. ���� �������� ��� ���繮�� �������� ���� ����
	
		//7. ������ ���ÿ� �����ڿ��� �˸� �߽�: ������(���� ��û), �����(���� �Ϸ�/����/�ݷ�)
		
	}
	

}
