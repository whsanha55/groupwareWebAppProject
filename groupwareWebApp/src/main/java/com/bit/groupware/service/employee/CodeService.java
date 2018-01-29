package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.CodeVO;

public interface CodeService {

	//�ڵ� ���
	boolean registerCode(CodeVO code);
		
	//�ڵ� ����Ʈ ��ȸ
	List<CodeVO> retrieveCodeList(Map<String, Object> map);
		
	//�ڵ� ����
	void modifyCode(CodeVO code);
		
	//�ڵ� ����
	int removeCode(CodeVO code);
	
}
