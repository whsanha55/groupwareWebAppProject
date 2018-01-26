package com.bit.groupware.persistent.employee;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.employee.PlanFileVO;

@Repository
public class PlanFileDAOImpl implements PlanFileDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.employee.PlanFileMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertPlanFile(PlanFileVO file) {
		sqlSession.insert(NAMESPACE + ".insertPlanFile", file);
	}
	
	public void deletePlanFile(String pNo) {
		sqlSession.delete(NAMESPACE + ".deletePlanFile", pNo);
	}
	
}
