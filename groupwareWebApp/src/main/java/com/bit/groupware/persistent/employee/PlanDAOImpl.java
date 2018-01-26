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
	
	
	//일정 목록 조회
	public List<PlanVO> selectPlanList(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectPlanList", map);
	}
	
	//일정 등록
	public String insertPlan(PlanVO plan) {
		sqlSession.insert(NAMESPACE + ".insertPlan", plan);
		return plan.getpNo();
	}
	
	//일정번호에 해당하는 일정 상세 조회
	public PlanVO selectPlan(String pNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectPlan", pNo);
	}
	
	//일정정보 수정
	public void updatePlan(PlanVO plan) {
		sqlSession.update(NAMESPACE + ".updatePlan", plan);
	}
	
	//일정정보 삭제
	public void deletePlan(String pNo) {
		sqlSession.selectOne(NAMESPACE + ".deletePlan", pNo);
	}
	
}
