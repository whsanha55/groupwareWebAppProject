package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.ApprovalFileVO;
import com.bit.groupware.domain.approval.ApprovalRecordVO;
import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.persistent.approval.ApprovalDAO;
import com.bit.groupware.persistent.approval.ApprovalFileDAO;
import com.bit.groupware.persistent.approval.ApprovalRecordDAO;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private ApprovalDAO dao;
	
	@Autowired
	private ApprovalFileDAO fileDAO;
	
	@Autowired
	private ApprovalRecordDAO recordDAO;
	
	
	//���繮�� ��ȸ
	public List<ApprovalVO> retrieveApprovalList(Map<String, Object> map) {
		return dao.selectApprovalList(map);
	}

	//���繮�� ����ȸ
	public ApprovalVO retrieveApproval(int apprNo) {
		return dao.selectApproval(apprNo);
	}

	//��ȹ��� ���
	public void registerApproval(ApprovalVO approval) {
		//1. ���繮�� ���
		int apprNo = dao.insertApproval(approval);
		approval.setApprNo(apprNo);
		
		//2. ���� ÷������ ���
		List<ApprovalFileVO> files = approval.getApprovalFiles();
		if(approval.getUpload().size() != 0) {
			for(ApprovalFileVO file : files) {
				file.setApproval(approval);
			}
			fileDAO.insertApprovalFileList(files);
		}
		
		//3. ���� �̷� ���(���� �����ڸ�)
		List<ApprovalRecordVO> records = approval.getApprovalRecords();
		ApprovalRecordVO record = records.get(0);
		recordDAO.insertApprovalRecord(record);
		
		//4. �˸� ���-Ʈ����		
	}

	
	//���� ���� ȸ��
	public void modifyApproval(ApprovalVO approval) {		
		//1. ���� �̷� ����
		recordDAO.deleteApprovalRecord(approval.getApprNo());
			
		//2. ���繮�� �������� ���� ���� = approval.setFinalStatus�� ��Ʈ�ѷ�����?
		dao.updateApproval(approval);		
	}


	
	
}