package com.bit.groupware.persistent.employee;

import java.util.Map;

public interface PlanFileDAO {

	//���� ���� ���
	void insertPlanFile(Map<String, Object> map);
	
	//���� ���� ����
	void deletePlanFile(String pNo);
	
	//���� ���ϸ� ����
	void deletePlanFile2(String fileNo);
	
}
