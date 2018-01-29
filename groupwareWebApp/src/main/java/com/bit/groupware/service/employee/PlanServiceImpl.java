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
	
	//일정 목록 조회
	public List<PlanVO> retrievePlanList(Map<String, Object> map) {
		return planDAO.selectPlanList(map);
	}
	
	//일정 등록
	public void registerPlan(PlanVO plan) {
		String pNo = planDAO.insertPlan(plan);
		PlanFileVO file = plan.getFile();
		if(plan.getFile() != null) {
			file.setpNo(pNo);
			planFileDAO.insertPlanFile(file);
		}
	}
	
	//일정 상세 조회
	public PlanVO retrievePlan(String pNo) {
		return planDAO.selectPlan(pNo);
	}
	
	//일정정보 수정
	public void modifyPlan(PlanVO plan) {
		planDAO.updatePlan(plan);
		PlanFileVO file = plan.getFile();
		if(plan.getFile() != null) {
			file.setpNo(plan.getpNo());
			planFileDAO.insertPlanFile(file);
		}
	}
	
	//일정정보 삭제
	public void removePlan(String pNo) {
		planDAO.deletePlan(pNo);
		planFileDAO.deletePlanFile(pNo);
	}
	
}
