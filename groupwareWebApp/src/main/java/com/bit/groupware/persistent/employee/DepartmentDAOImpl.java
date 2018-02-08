package com.bit.groupware.persistent.employee;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.employee.DepartmentVO;

@Repository
public class DepartmentDAOImpl implements DepartmentDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.employee.DepartmentMapper";

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<DepartmentVO> selectDeptList() {
		return sqlSession.selectList(NAMESPACE + ".selectDeptList");		
	}
	
	public DepartmentVO selectDeptCharge(String cNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectDeptCharge", cNo);
	}
	
	public int selectDeptEmp(String cNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectDeptEmp", cNo);
	}
	
	public int selectDeptTeam(String cNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectDeptTeam", cNo);
	}
	
	public void updateHead(String newHead) {
		sqlSession.update(NAMESPACE + ".updateHead", newHead);
	}
	
	public void retireHead(String oldHead) {
		sqlSession.update(NAMESPACE + ".updateHead", oldHead);
	}
	
}
