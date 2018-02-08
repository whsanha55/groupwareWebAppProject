package com.bit.groupware.persistent.employee;

import java.util.List;

import com.bit.groupware.domain.employee.DepartmentVO;

public interface DepartmentDAO {

	List<DepartmentVO> selectDeptList();
	
	DepartmentVO selectDeptCharge(String cNo);
	
	int selectDeptEmp(String cNo);
	
	int selectDeptTeam(String cNo);
	
	void updateHead(String newHead);
	
	void retireHead(String oldHead);
}
