package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.DepartmentVO;
import com.bit.groupware.domain.employee.EmployeeVO;

public interface DepartmentDAO {

	List<DepartmentVO> selectDeptList(Map<String, Object> map);
	
	DepartmentVO selectDeptCharge(String cNo);
	
	int selectDeptEmp(String cNo);
	
	int selectDeptTeam(String cNo);

	void updateHead(String newHead);
	
	void retireHead(String oldHead);
	
	List<EmployeeVO> selectDeptEmpDetail(String cNo);
}
