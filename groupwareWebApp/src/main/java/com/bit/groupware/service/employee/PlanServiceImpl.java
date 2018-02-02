package com.bit.groupware.service.employee;

import java.nio.file.Files;
import java.util.HashMap;
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
		List<PlanFileVO> files = plan.getFiles();
		if(files.size() != 0) {
			for(PlanFileVO file : files) {
				file.setpNo(pNo);
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("planFiles", files);
			planFileDAO.insertPlanFile(map);
		}
	}
	
	//일정 상세 조회
	public PlanVO retrievePlan(String pNo) {
		return planDAO.selectPlan(pNo);
	}
	
	//일정정보 수정
	public void modifyPlan(PlanVO plan) {
		planDAO.updatePlan(plan);
		List<PlanFileVO> files = plan.getFiles();
		if(files.size() != 0) {
			for(PlanFileVO file : files) {
				file.setpNo(plan.getpNo());
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("planFiles", files);
			planFileDAO.insertPlanFile(map);
		}
	}
	
	//일정정보 삭제
	public void removePlan(String pNo) {
		planDAO.deletePlan(pNo);
		planFileDAO.deletePlanFile(pNo);
	}
	
}
