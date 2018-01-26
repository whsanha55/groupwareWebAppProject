package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.DeputyVO;

public interface DeputyDAO {

	void insertDeputy(DeputyVO deputy);
	
	List<DeputyVO> selectDeputyList(Map<String, Object> map);

}
