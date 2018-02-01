package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.CodeVO;

public interface CodeService {

	//코드 등록
	void registerCode(CodeVO code);
	
	//코드 이름 조회
	CodeVO retrieveCode(String cNo);
		
	//최상위 코드 리스트 조회
	List<CodeVO> retrieveCodeList1(Map<String, Object> map);
	
	//하위 코드 리스트 조회
	List<CodeVO> retrieveCodeList2(Map<String, Object> map);
	
	//최하위 코드 리스트 조회
	List<CodeVO> retrieveCodeList3(Map<String, Object> map);
		
	//코드 수정
	void modifyCode(CodeVO code);
		
	//코드 삭제
	void removeCode(String cNo);
	
	int checkRelationCode(String relationCode);
	
	List<CodeVO> retrieveDeptCodeList();
	
	List<CodeVO> retrieveDutyCodeList();
}
