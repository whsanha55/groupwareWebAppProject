package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.PlanVO;

public interface PlanDAO {

	//���� ��� ��ȸ
	List<PlanVO> selectPlanList(Map<String, Object> map);
	
	//���� ���
	void insertPlan(PlanVO plan);
	
	//������ȣ�� �ش��ϴ� ���� �� ��ȸ
	PlanVO selectPlan(String pNo);
	
	//�������� ����
	void updatePlan(PlanVO plan);
	
	//�������� ����
	void deletePlan(String pNo);
}
