package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.approval.DelegationVO;

public interface DelegationDAO {

	void insertDelegationList(Map<String,Object> map);
	
	void deleteDelegations(int deleNo);
	
	List<DelegationVO> selectDelegations(Map<String,Object> map);
	
	int selectDelegationsCount(Map<String,Object> map);
	
}
