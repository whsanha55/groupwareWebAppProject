package com.bit.groupware.persistent.employee;

import com.bit.groupware.domain.employee.PlanFileVO;

public interface PlanFileDAO {

	//���� ���� ���
	void insertPlanFile(PlanFileVO file);
	
	//���� ���� ����
	void deletePlanFile(String pNo);
	
}
