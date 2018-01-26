package com.bit.groupware.service.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.CodeVO;

public interface CodeService {

	//�ڵ� ���
	void registerCode(CodeVO code);
		
	//�ڵ� �̸� �ߺ�üũ
	boolean checkCodeName(String cName);
		
	//���� �ڵ� �� Ȯ��
	int checkRelationCode(String relationCode);
		
	//�ڵ� ����Ʈ ��ȸ
	List<CodeVO> retrieveCodeList(Map<String, Object> map);
		
	//�ڵ� ����
	void modifyCode(CodeVO code);
		
	//�ڵ� ����
	void removeCode(String cNo);
	
}
