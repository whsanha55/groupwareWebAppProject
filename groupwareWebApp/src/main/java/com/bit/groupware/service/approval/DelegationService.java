package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.DelegationVO;

public interface DelegationService {

	void registerDelegationList(Map<String,Object> map);
	
	void removeDelegations(int deleNo);
	
	List<DelegationVO> retrieveDelegations(Map<String,Object> map);
	
	int retrieveDelegationsCount(Map<String,Object> map);
}
