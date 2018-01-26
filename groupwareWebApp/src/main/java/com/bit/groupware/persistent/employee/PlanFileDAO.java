package com.bit.groupware.persistent.employee;

import com.bit.groupware.domain.employee.PlanFileVO;

public interface PlanFileDAO {

	//일정 파일 등록
	void insertPlanFile(PlanFileVO file);
	
	//일정 파일 삭제
	void deletePlanFile(String pNo);
	
}
