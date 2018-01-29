package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.employee.PlanFileVO;
import com.bit.groupware.domain.employee.PlanVO;
import com.bit.groupware.persistent.employee.PlanDAO;
import com.bit.groupware.persistent.employee.PlanFileDAO;

@Service
public class PlanServiceImpl implements PlanService {

	@Autowired
	private PlanDAO planDAO;
	@Autowired
	private PlanFileDAO planFileDAO;
	
	//���� ��� ��ȸ
	public List<PlanVO> retrievePlanList(Map<String, Object> map) {
		return planDAO.selectPlanList(map);
	}
	
	//���� ���
	public void registerPlan(PlanVO plan) {
		String pNo = planDAO.insertPlan(plan);
		PlanFileVO file = plan.getFile();
		if(plan.getFile() != null) {
			file.setpNo(pNo);
			planFileDAO.insertPlanFile(file);
		}
	}
	
	//���� �� ��ȸ
	public PlanVO retrievePlan(String pNo) {
		return planDAO.selectPlan(pNo);
	}
	
	//�������� ����
	public void modifyPlan(PlanVO plan) {
		planDAO.updatePlan(plan);
		PlanFileVO file = plan.getFile();
		if(plan.getFile() != null) {
			file.setpNo(plan.getpNo());
			planFileDAO.insertPlanFile(file);
		}
	}
	
	//�������� ����
	public void removePlan(String pNo) {
		planDAO.deletePlan(pNo);
		planFileDAO.deletePlanFile(pNo);
	}
	
}
