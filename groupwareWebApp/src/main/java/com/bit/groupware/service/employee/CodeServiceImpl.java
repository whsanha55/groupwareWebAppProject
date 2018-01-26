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
	
	//�ڵ带 ����ϴ�.
	public void registerCode(CodeVO code) {
		codeDAO.insertCode(code);
	}

	//�ڵ� �̸� �ߺ�üũ
	public boolean checkCodeName(String cName) {
		return codeDAO.checkCode(cName);
	}
	
	//���� �ڵ� �� Ȯ��
	public int checkRelationCode(String relationCode) {
		return codeDAO.checkRelation(relationCode);
	}
	
	//�ڵ� ����Ʈ ��ȸ
	public List<CodeVO> retrieveCodeList(Map<String, Object> map) {
		return codeDAO.selectCodeList(map);
	}
	
	//�ڵ� ����
	public void modifyCode(CodeVO code) {
		codeDAO.updateCode(code);
	}
	
	//�ڵ� ����
	public void removeCode(String cNo) {
		codeDAO.deleteCode(cNo);
	}
	
	
}
