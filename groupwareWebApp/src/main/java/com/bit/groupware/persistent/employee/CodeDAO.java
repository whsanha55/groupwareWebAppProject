package com.bit.groupware.persistent.employee;

import java.util.List;
import java.util.Map;

import com.bit.groupware.domain.employee.CodeVO;

public interface CodeDAO {

	//�ڵ� ���
	void insertCode(CodeVO code);
	
	//�ڵ� �̸� �ߺ�üũ
	boolean checkCode(String cName);
	
	//���� �ڵ� �� Ȯ��
	int checkRelation(String relationCode);
	
	//�ڵ� ����Ʈ ��ȸ
	List<CodeVO> selectCodeList(Map<String, Object> map);
	
	//�ڵ� ����
	void updateCode(CodeVO code);
	
	//�ڵ� ����
	void deleteCode(CodeVO code);
}
