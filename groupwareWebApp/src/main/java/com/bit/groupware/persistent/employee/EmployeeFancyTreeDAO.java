package com.bit.groupware.persistent.employee;

import java.util.List;

import com.bit.groupware.domain.employee.EmpFancyTreeVO;

public interface EmployeeFancyTreeDAO {
	
	//fancytree 부서조회
	List<EmpFancyTreeVO> selectFancyTreeDeptList();
	
	//fancytree 사원조회(lazyload)
	List<EmpFancyTreeVO> selectFancyTreeEmpList(String dutyNo);
	
	//fancytree 모두조회
	List<EmpFancyTreeVO> selectFancyTreeAllList();
	
}
