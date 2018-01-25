package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.CodeVO;

public interface CodeDAO {

	//코드 등록
	void insertCode(CodeVO code);
	
	//코드 이름 중복체크
	boolean checkCode(String cName);
	
	//하위 코드 수 확인
	int checkRelation(String relationCode);
	
	//코드 리스트 조회
	List<CodeVO> selectCodeList(Map<String, Object> map);
	
	//코드 수정
	void updateCode(CodeVO code);
	
	//코드 삭제
	void deleteCode(CodeVO code);
}
