package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.AuthEmpVO;

public interface AuthEmpDAO {

	//���ѹ�ȣ�� �ش��ϴ� ��������� ��������� �������� �����Ͽ� ��ȸ�Ѵ�.
	List<AuthEmpVO> selectAuthEmp();
	
	//���ѹ�ȣ�� �ش��ϴ� ��������� �ϰ� �����Ѵ�.
	void deleteAuthEmp(Map<String, Object> map);	

}
