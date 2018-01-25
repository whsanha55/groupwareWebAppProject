package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.authority.AuthEmpVO;

public interface AuthEmpDAO {

	//권한번호에 해당하는 사원정보를 사번순으로 오름차순 정렬하여 조회한다.
	List<AuthEmpVO> selectAuthEmp();
	
	//권한번호에 해당하는 사원정보를 일괄 삭제한다.
	void deleteAuthEmp(Map<String, Object> map);	

}
