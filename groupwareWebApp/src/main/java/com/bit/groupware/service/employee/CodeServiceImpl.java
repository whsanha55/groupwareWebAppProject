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
	public boolean registerCode(CodeVO code) {
		if(codeDAO.checkCode(code.getcName()) == true) {
			codeDAO.insertCode(code);
			return codeDAO.checkCode(code.getcName());
		} else {
			return codeDAO.checkCode(code.getcName());
		}
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
	public int removeCode(CodeVO code) {
		if(codeDAO.checkRelation(code.getRelationCode()) == 0) {
			codeDAO.deleteCode(code.getcNo());
			return codeDAO.checkRelation(code.getRelationCode());
		} else {
			return codeDAO.checkRelation(code.getRelationCode());
		}	
	}
}
