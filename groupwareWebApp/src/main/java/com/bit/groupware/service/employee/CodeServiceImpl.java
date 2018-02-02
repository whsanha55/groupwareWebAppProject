package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.controller.employee.AdminRegisterCodeController;
import com.bit.groupware.domain.employee.CodeVO;
import com.bit.groupware.persistent.employee.CodeDAO;

@Service
public class CodeServiceImpl implements CodeService {
	private static final Logger logger = LoggerFactory.getLogger(CodeServiceImpl.class);
	@Autowired
	private CodeDAO codeDAO;
	
	//코드를 등록하다.
	public void registerCode(CodeVO code) {
		codeDAO.insertCode(code);
	}
	
	
	//모든 부서 조회(팀까지)
	public List<CodeVO> retrieveDeptAll() {
		return codeDAO.selectDeptAll();
	}


	//코드를 조회하다.
	public CodeVO retrieveCode(String cNo) {
		return codeDAO.selectCode(cNo);
	}
	
	//최상위 코드 리스트 조회
	public List<CodeVO> retrieveCodeList1(Map<String, Object> map) {
		return codeDAO.selectCodeList1(map);
	}
	
	//하위 코드 리스트 조회
	public List<CodeVO> retrieveCodeList2(Map<String, Object> map) {
		return codeDAO.selectCodeList2(map);
	}
	
	//최하위 코드 리스트 조회
	public List<CodeVO> retrieveCodeList3(Map<String, Object> map) {
		return codeDAO.selectCodeList3(map);
	}
	
	//코드 수정
	public void modifyCode(CodeVO code) {
		logger.info("코드 수정 Code : {}", code);
		codeDAO.updateCode(code);
	}
	
	//코드 삭제
	public void removeCode(String cNo) {
		codeDAO.deleteCode(cNo);
	}
	
	public int checkRelationCode(String relationCode) {
		return codeDAO.checkRelation(relationCode);
	}
	
	public List<CodeVO> retrieveDeptCodeList() {
		return codeDAO.selectDeptCodeList();
	}
	
	public List<CodeVO> retrieveDutyCodeList() {
		return codeDAO.selectDutyCodeList();
	}
}
