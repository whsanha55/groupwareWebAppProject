package com.bit.groupware.service.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.employee.EmpFancyTreeVO;
import com.bit.groupware.domain.employee.EmployeeCodeVO;
import com.bit.groupware.persistent.employee.EmployeeFancyTreeDAO;

@Service
public class EmployeeFancyTreeServiceImpl implements EmployeeFancyTreeService {

	@Autowired
	private EmployeeFancyTreeDAO employeeFancyTreeDAO;
	
	public List<EmpFancyTreeVO> retrieveEmployeeDeptList() {
		return employeeFancyTreeDAO.selectFancyTreeDeptList();
	}

	public List<EmpFancyTreeVO> retrieveEmployeeEmpList(String dutyNo) {
		return employeeFancyTreeDAO.selectFancyTreeEmpList(dutyNo);
	}

	public List<EmpFancyTreeVO> retrieveEmployeeAllList() {
		return employeeFancyTreeDAO.selectFancyTreeAllList();
	}

}
