package com.bit.groupware.persistent.approval;

import java.util.List;

import com.bit.groupware.domain.approval.DelegationVO;

public interface DelegationDAO {

	void insertDelegationList(List<DelegationVO> delegations);
	
	void deleteDelegations(DelegationVO delegation);
	
	
}
