package com.bit.groupware.persistent.approval;

import java.util.List;

import com.bit.user.domain.approval.DelegationVO;

public interface DelegationDAO {

	void insertDelegationList(List<DelegationVO> delegations);
	
	void deleteDelegations(DelegationVO delegation);
	
	
}
