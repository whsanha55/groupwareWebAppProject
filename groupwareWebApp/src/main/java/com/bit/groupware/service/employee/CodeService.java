package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.CodeVO;

public interface CodeService {

	//코드 등록
	void registerCode(CodeVO code);
		
	//코드 이름 중복체크
	boolean checkCodeName(String cName);
		
	//하위 코드 수 확인
	int checkRelationCode(String relationCode);
		
	//코드 리스트 조회
	List<CodeVO> retrieveCodeList(Map<String, Object> map);
		
	//코드 수정
	void modifyCode(CodeVO code);
		
	//코드 삭제
	void removeCode(String cNo);
	
}
