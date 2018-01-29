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
	public boolean registerCode(CodeVO code) {
		if(codeDAO.checkCode(code.getcName()) == true) {
			codeDAO.insertCode(code);
			return codeDAO.checkCode(code.getcName());
		} else {
			return codeDAO.checkCode(code.getcName());
		}
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
	public int removeCode(CodeVO code) {
		if(codeDAO.checkRelation(code.getRelationCode()) == 0) {
			codeDAO.deleteCode(code.getcNo());
			return codeDAO.checkRelation(code.getRelationCode());
		} else {
			return codeDAO.checkRelation(code.getRelationCode());
		}	
	}
}
