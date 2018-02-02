package com.bit.groupware.persistent.employee;

import java.util.Map;

public interface PlanFileDAO {

	//일정 파일 등록
	void insertPlanFile(Map<String, Object> map);
	
	//일정 파일 삭제
	void deletePlanFile(String pNo);
	
	//일정 파일만 삭제
	void deletePlanFile2(String fileNo);
	
}
