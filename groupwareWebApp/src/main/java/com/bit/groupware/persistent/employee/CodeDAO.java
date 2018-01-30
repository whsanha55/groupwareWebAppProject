package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.CodeVO;

public interface CodeDAO {

	//코드 등록
	void insertCode(CodeVO code);
	
	//코드번호 중복체크
	boolean checkCodeNo(String cNo);
	
	//코드 이름 중복체크
	boolean checkCode(String cName);
	
	//하위 코드 수 확인
	int checkRelation(String relationCode);
	
	//최상위 코드 리스트 조회
	List<CodeVO> selectCodeList1(Map<String, Object> map);
	
	//하위 코드 리스트 조회
	List<CodeVO> selectCodeList2(Map<String, Object> map);
	
	//최하위 코드 리스트 조회
	List<CodeVO> selectCodeList3(Map<String, Object> map);
	
	//코드 수정
	void updateCode(CodeVO code);
	
	//코드 삭제
	void deleteCode(String cNo);
}
