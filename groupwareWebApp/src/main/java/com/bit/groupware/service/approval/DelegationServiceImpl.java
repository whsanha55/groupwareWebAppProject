package com.bit.groupware.service.approval;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.approval.DelegationVO;
import com.bit.groupware.persistent.approval.DelegationDAO;

@Service
public class DelegationServiceImpl implements DelegationService {
	@Autowired
	private DelegationDAO delegationDAO;
	
	public void registerDelegationList(Map<String,Object> map) {
		delegationDAO.insertDelegationList(map); 
	}

	public void removeDelegations(int deleNo) {
		delegationDAO.deleteDelegations(deleNo); 
	}

	public List<DelegationVO> retrieveDelegations(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return delegationDAO.selectDelegations(map); 
	}

	public int retrieveDelegationsCount(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return delegationDAO.selectDelegationsCount(map); 
	}

}
