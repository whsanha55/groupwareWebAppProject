package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.PlanVO;

public interface PlanService {

	//일정 목록 조회
	List<PlanVO> retrievePlanList(Map<String, Object> map);
		
	//일정 등록
	void registerPlan(PlanVO plan);
		
	//일정번호에 해당하는 일정 상세 조회
	PlanVO retrievePlan(String pNo);
		
	//일정정보 수정
	void modifyPlan(PlanVO plan);
		
	//일정정보 삭제
	void removePlan(String pNo);
}
