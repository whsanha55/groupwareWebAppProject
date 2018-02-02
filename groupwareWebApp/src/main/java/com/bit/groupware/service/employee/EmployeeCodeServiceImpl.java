package com.bit.groupware.service.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.employee.EmployeeCodeVO;
import com.bit.groupware.persistent.employee.EmployeeCodeDAO;

@Service
public class EmployeeCodeServiceImpl implements EmployeeCodeService {

	@Autowired
	private EmployeeCodeDAO employeeCodeDAO;
	
	public List<EmployeeCodeVO> retrieveEmployeeCodeList() {
		return employeeCodeDAO.selectEmployeeCodeList();
	}

}
