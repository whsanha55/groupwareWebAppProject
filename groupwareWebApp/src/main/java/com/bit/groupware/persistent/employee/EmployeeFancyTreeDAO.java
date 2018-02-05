package com.bit.groupware.persistent.employee;

import java.util.List;

import com.bit.groupware.domain.employee.EmpFancyTreeVO;

public interface EmployeeFancyTreeDAO {
	
	//fancytree �μ���ȸ
	List<EmpFancyTreeVO> selectFancyTreeDeptList();
	
	//fancytree �����ȸ(lazyload)
	List<EmpFancyTreeVO> selectFancyTreeEmpList(String dutyNo);
	
	//fancytree �����ȸ
	List<EmpFancyTreeVO> selectFancyTreeAllList();
	
}
