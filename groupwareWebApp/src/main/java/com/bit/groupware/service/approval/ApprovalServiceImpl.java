package com.bit.groupware.service.approval;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.ApprovalFileVO;
import com.bit.groupware.domain.approval.ApprovalRecordVO;
import com.bit.groupware.domain.approval.ApprovalVO;
import com.bit.groupware.persistent.approval.ApprovalCommentDAO;
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

	@Autowired
	private ApprovalCommentDAO commentDAO;
	
	// ���繮�� ��ȸ(��������)
	public List<ApprovalVO> retrieveApprovalList(Map<String, Object> map) {
		return dao.selectApprovalList(map);
	}
	
	//���繮�� ��ȸ(����,�ݷ�������)
	public List<ApprovalVO> retrieveAllApprovalList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectAllApprovalList(map); 
	}

	// ���繮�� ����ȸ
	public ApprovalVO retrieveApproval(int apprNo) {
		return dao.selectApproval(apprNo);
	}


	// ��ȹ��� ���
	public void registerApproval(ApprovalVO approval, int receiverNo) {
		// 1. ���繮�� ���
		int apprNo = dao.insertApproval(approval);
		approval.setApprNo(apprNo);

		// 2. ���� ÷������ ���
		List<ApprovalFileVO> files = approval.getApprovalFiles();
		if (files.size() != 0) {
			for (ApprovalFileVO file : files) {
				file.setApproval(approval);
			}
			fileDAO.insertApprovalFileList(files);
		}

		// 3. �����̷� ��� , �ӽú����� �̷µ�Ͼ���
		if(approval.getApprFinalStatus() ==0) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("apprNo", apprNo);
			map.put("receiverNo", receiverNo);
			recordDAO.insertApprovalRecordProcedure(map);
		}
		
		// 4. �˸� ���-Ʈ����
		
	}


	// ���� ���� ȸ��/����
	public void modifyApproval(ApprovalVO approval) {
		//'ȸ��'�� ��� ���� �̷� ����
		/*if(approval.getApprFinalStatus() == 5) {
			recordDAO.deleteApprovalRecord(approval.getApprNo());	
		}*/
		//���繮�� �������� ���� ����
		dao.updateApproval(approval);
		
	}
	
	
	//���� ���ϱ�
	public int retrieveApprovalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectApprovalCount(map); 
	}

	//����(�����ؼ� ������ - �ӽú�����)
	public void removeApproval(List<Integer> apprNos) {
		// TODO Auto-generated method stub
		fileDAO.deleteApprovalFilesByApprNO(apprNos); 
		recordDAO.deleteApprovalRecord(apprNos);
		
		dao.deleteApproval(apprNos); 
	}

	/*public void removeAboutApproval(ApprovalVO appr) {
		// TODO Auto-generated method stub
		List<Integer> apprNos=new ArrayList<Integer>();
		apprNos.add(appr.getApprNo());
		if(appr.getApprovalFiles().size()!=0) {
			fileDAO.deleteApprovalFilesByApprNO(apprNos);
		}
		if(appr.getApprovalRecords().size()!=0) {
			recordDAO.deleteApprovalRecord(apprNos); 
			for(ApprovalRecordVO ar:appr.getApprovalRecords()) {
				if(ar.getApprovalComment()!=null) {
					commentDAO.deleteApprovalCommentByApprNo(appr.getApprNo()); 
				}
			}
		}
		
	}*/

	public ApprovalVO retrieveTempApproval(int apprNO) {
		// TODO Auto-generated method stub
		return dao.selectTempApproval(apprNO); 
	}

	public int retrieveAllApprovalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectAllApprovalCount(map); 
	}
	
}
