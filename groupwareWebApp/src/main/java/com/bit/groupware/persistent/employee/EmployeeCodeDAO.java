package com.bit.groupware.persistent.employee;

import java.util.List;

import com.bit.groupware.domain.employee.EmployeeCodeVO;

public interface EmployeeCodeDAO {

	List<EmployeeCodeVO> selectEmployeeCodeList();
}
