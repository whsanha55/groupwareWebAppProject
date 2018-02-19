package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.employee.DepartmentVO;
import com.bit.groupware.domain.employee.EmployeeVO;

@Repository
public class DepartmentDAOImpl implements DepartmentDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.employee.DepartmentMapper";

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<DepartmentVO> selectDeptList(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectDeptList", map);		
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
		sqlSession.update(NAMESPACE + ".retireHead", oldHead);
	}
	
	public List<EmployeeVO> selectDeptEmpDetail(String cNo) {
		return sqlSession.selectList(NAMESPACE + ".selectDeptEmpDetail", cNo);
	}
	
}
