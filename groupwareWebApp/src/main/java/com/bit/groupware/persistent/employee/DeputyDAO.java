package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.DeputyVO;
import com.bit.groupware.domain.employee.EmployeeVO;

public interface DeputyDAO {

	void insertDeputy(DeputyVO deputy);
	
	List<DeputyVO> selectDeputyList(Map<String, Object> map);

	List<EmployeeVO> selectDeputyRegisterEmployeeList(Map<String, Object> map);
	
	int selectDeputyRegisterCount(Map<String, Object> map);
}
