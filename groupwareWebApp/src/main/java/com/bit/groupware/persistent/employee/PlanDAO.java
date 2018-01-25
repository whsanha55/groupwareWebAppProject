package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.PlanVO;

public interface PlanDAO {

	//일정 목록 조회
	List<PlanVO> selectPlanList(Map<String, Object> map);
	
	//일정 등록
	void insertPlan(PlanVO plan);
	
	//일정번호에 해당하는 일정 상세 조회
	PlanVO selectPlan(String pNo);
	
	//일정정보 수정
	void updatePlan(PlanVO plan);
	
	//일정정보 삭제
	void deletePlan(String pNo);
}
