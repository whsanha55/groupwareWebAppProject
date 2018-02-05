package com.bit.groupware.persistent.employee;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.employee.EmpFancyTreeVO;
import com.bit.groupware.domain.employee.EmployeeCodeVO;

@Repository
public class EmployeeFancyTreeDAOImpl implements EmployeeFancyTreeDAO {

	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.employee.EmployeeFancyTreeMapper";

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<EmpFancyTreeVO> selectFancyTreeDeptList() {
		return sqlSession.selectList(NAMESPACE + ".selectFancyTreeDeptList");
	}

	public List<EmpFancyTreeVO> selectFancyTreeEmpList(String dutyNo) {
		return sqlSession.selectList(NAMESPACE + ".selectFancyTreeEmpList",dutyNo);
	}

	public List<EmpFancyTreeVO> selectFancyTreeAllList() {
		return sqlSession.selectList(NAMESPACE + ".selectFancyTreeAllList");
	}

}
