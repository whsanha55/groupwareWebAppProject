package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.employee.CodeVO;
import com.bit.groupware.persistent.employee.CodeDAO;

@Service
public class CodeServiceImpl implements CodeService {

	@Autowired
	private CodeDAO codeDAO;
	
	//코드를 등록하다.
	public void registerCode(CodeVO code) {
		codeDAO.insertCode(code);
	}

	//코드 이름 중복체크
	public boolean checkCodeName(String cName) {
		return codeDAO.checkCode(cName);
	}
	
	//하위 코드 수 확인
	public int checkRelationCode(String relationCode) {
		return codeDAO.checkRelation(relationCode);
	}
	
	//코드 리스트 조회
	public List<CodeVO> retrieveCodeList(Map<String, Object> map) {
		return codeDAO.selectCodeList(map);
	}
	
	//코드 수정
	public void modifyCode(CodeVO code) {
		codeDAO.updateCode(code);
	}
	
	//코드 삭제
	public void removeCode(String cNo) {
		codeDAO.deleteCode(cNo);
	}
	
	
}
