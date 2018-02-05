package com.bit.groupware.service.employee;

import java.util.List;

import com.bit.groupware.domain.employee.EmpFancyTreeVO;

public interface EmployeeFancyTreeService {

	List<EmpFancyTreeVO> retrieveEmployeeDeptList();

	List<EmpFancyTreeVO> retrieveEmployeeEmpList(String dutyNo);

	List<EmpFancyTreeVO> retrieveEmployeeAllList();
}
