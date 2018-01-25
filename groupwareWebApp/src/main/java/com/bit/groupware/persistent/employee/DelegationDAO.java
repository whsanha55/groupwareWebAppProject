package com.bit.groupware.persistent.employee;

import java.util.List;

import com.bit.groupware.domain.employee.DelegationVO;

public interface DelegationDAO {

	void insertDelegationList(List<DelegationVO> delegations);
	
	void deleteDelegations(DelegationVO delegation);
	
	
}
