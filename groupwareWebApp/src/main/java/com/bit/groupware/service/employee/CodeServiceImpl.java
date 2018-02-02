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
	
	//�ڵ带 ����ϴ�.
	public void registerCode(CodeVO code) {
		codeDAO.insertCode(code);
	}
	
	
	//��� �μ� ��ȸ(������)
	public List<CodeVO> retrieveDeptAll() {
		return codeDAO.selectDeptAll();
	}


	//�ڵ带 ��ȸ�ϴ�.
	public CodeVO retrieveCode(String cNo) {
		return codeDAO.selectCode(cNo);
	}
	
	//�ֻ��� �ڵ� ����Ʈ ��ȸ
	public List<CodeVO> retrieveCodeList1(Map<String, Object> map) {
		return codeDAO.selectCodeList1(map);
	}
	
	//���� �ڵ� ����Ʈ ��ȸ
	public List<CodeVO> retrieveCodeList2(Map<String, Object> map) {
		return codeDAO.selectCodeList2(map);
	}
	
	//������ �ڵ� ����Ʈ ��ȸ
	public List<CodeVO> retrieveCodeList3(Map<String, Object> map) {
		return codeDAO.selectCodeList3(map);
	}
	
	//�ڵ� ����
	public void modifyCode(CodeVO code) {
		logger.info("�ڵ� ���� Code : {}", code);
		codeDAO.updateCode(code);
	}
	
	//�ڵ� ����
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
