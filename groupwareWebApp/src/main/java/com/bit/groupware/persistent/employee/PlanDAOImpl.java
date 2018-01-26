package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.employee.PlanVO;

@Repository
public class PlanDAOImpl implements PlanDAO{
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.employee.PlanMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//���� ��� ��ȸ
	public List<PlanVO> selectPlanList(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectPlanList", map);
	}
	
	//���� ���
	public String insertPlan(PlanVO plan) {
		sqlSession.insert(NAMESPACE + ".insertPlan", plan);
		return plan.getpNo();
	}
	
	//������ȣ�� �ش��ϴ� ���� �� ��ȸ
	public PlanVO selectPlan(String pNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectPlan", pNo);
	}
	
	//�������� ����
	public void updatePlan(PlanVO plan) {
		sqlSession.update(NAMESPACE + ".updatePlan", plan);
	}
	
	//�������� ����
	public void deletePlan(String pNo) {
		sqlSession.selectOne(NAMESPACE + ".deletePlan", pNo);
	}
	
}
