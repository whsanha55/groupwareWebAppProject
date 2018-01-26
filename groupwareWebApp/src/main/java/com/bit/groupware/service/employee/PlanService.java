package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.PlanVO;

public interface PlanService {

	//���� ��� ��ȸ
	List<PlanVO> retrievePlanList(Map<String, Object> map);
		
	//���� ���
	void registerPlan(PlanVO plan);
		
	//������ȣ�� �ش��ϴ� ���� �� ��ȸ
	PlanVO retrievePlan(String pNo);
		
	//�������� ����
	void modifyPlan(PlanVO plan);
		
	//�������� ����
	void removePlan(String pNo);
}
